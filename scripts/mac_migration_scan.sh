#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-scan}"
DEST_ROOT="${2:-}"

USER_HOME="${HOME}"
TS="$(date +%Y%m%d_%H%M%S)"
OUT_DIR="${USER_HOME}/migration_audit_${TS}"
REPORT_MD="${OUT_DIR}/MIGRATION_REPORT.md"
PATHS_FILE="${OUT_DIR}/recommended_paths.txt"
RSYNC_LOG="${OUT_DIR}/rsync_backup.log"

mkdir -p "${OUT_DIR}"

# Prioritized paths: keep this list conservative and explicit.
RECOMMENDED_PATHS=(
  "Desktop"
  "Documents"
  "Downloads"
  "Movies"
  "Music"
  "Pictures"
  "Applications"
  "Library/CloudStorage"
  "Library/Mobile Documents"
  "Library/Application Support"
  "Library/Group Containers"
  "Library/Preferences"
  "Library/Safari"
  "Library/Mail"
  "Library/Messages"
  "Library/Calendars"
  "Library/Reminders"
  "Library/Keychains"
  "Library/LaunchAgents"
  ".ssh"
  ".gnupg"
  ".aws"
  ".docker"
  ".config"
  ".codex"
  ".claude"
  ".claude.json"
  ".gitconfig"
  ".zshrc"
  ".zprofile"
  ".zshenv"
  ".oh-my-zsh"
  ".nvm"
  ".npm"
  ".local"
)

OPTIONAL_PATHS=(
  ".cache"
  "Library/Caches"
  "Library/Logs"
  "Library/Saved Application State"
)

safe_du() {
  local p="$1"
  du -sh "$p" 2>/dev/null || echo "n/a  $p"
}

get_size() {
  local p="$1"
  local s
  s="$(du -sh "$p" 2>/dev/null | awk '{print $1}' || true)"
  if [ -n "${s}" ]; then
    echo "${s}"
  else
    echo "permission-limited"
  fi
}

collect_scan() {
  {
    echo "# Mac Migration Report"
    echo
    echo "Generated: $(date)"
    echo "Host: $(scutil --get ComputerName 2>/dev/null || hostname)"
    echo "User: $(whoami)"
    echo "macOS: $(sw_vers -productVersion 2>/dev/null || echo unknown) ($(sw_vers -buildVersion 2>/dev/null || echo unknown))"
    echo
    echo "## Executive Summary"
    echo "Use the transfer set below. This prioritizes user data, app state, credentials, and shell/dev config."
    echo "macOS privacy controls may block direct reads of some folders (for example Photos library); these are called out below."
    echo
    echo "## Recommended Transfer Paths"
    echo
    echo "| Path | Present | Size |"
    echo "|---|---:|---:|"
    > "${PATHS_FILE}"

    for rel in "${RECOMMENDED_PATHS[@]}"; do
      abs="${USER_HOME}/${rel}"
      if [ -e "$abs" ]; then
        size="$(get_size "$abs")"
        echo "| ${rel} | yes | ${size} |"
        printf '%s\n' "$rel" >> "${PATHS_FILE}"
      else
        echo "| ${rel} | no | - |"
      fi
    done

    echo
    echo "## Usually Optional / Rebuildable"
    echo
    echo "| Path | Present | Size |"
    echo "|---|---:|---:|"
    for rel in "${OPTIONAL_PATHS[@]}"; do
      abs="${USER_HOME}/${rel}"
      if [ -e "$abs" ]; then
        size="$(get_size "$abs")"
        echo "| ${rel} | yes | ${size} |"
      else
        echo "| ${rel} | no | - |"
      fi
    done

    echo
    echo "## Largest App Data (Application Support)"
    echo
    printf '```text\n'
    du -sh "${USER_HOME}/Library/Application Support"/* 2>/dev/null | sort -hr | head -n 30 || true
    printf '```\n'

    echo
    echo "## Largest Group Containers"
    echo
    printf '```text\n'
    du -sh "${USER_HOME}/Library/Group Containers"/* 2>/dev/null | sort -hr | head -n 30 || true
    printf '```\n'

    echo
    echo "## Launch Agents"
    echo
    printf '```text\n'
    ls -1 "${USER_HOME}/Library/LaunchAgents" 2>/dev/null || true
    printf '```\n'

    echo
    echo "## Non-Apple Preference Files (Sample)"
    echo
    printf '```text\n'
    ls -1 "${USER_HOME}/Library/Preferences"/*.plist 2>/dev/null | grep -v '/com\.apple\.' | grep -v '/ByHost/' | head -n 120 || true
    printf '```\n'

    echo
    echo "## Package Managers"
    echo
    printf '```text\n'
    if command -v brew >/dev/null 2>&1; then
      echo "brew installed: yes"
      echo
      echo "brew leaves:"
      brew leaves 2>/dev/null || true
      echo
      echo "brew casks:"
      brew list --cask 2>/dev/null || true
    else
      echo "brew installed: no"
    fi
    printf '```\n'

    echo
    echo "## Manual Checklist Before Wipe"
    echo
    echo "- Verify cloud providers are fully synced (iCloud Drive, OneDrive)."
    echo "- Confirm Photos library and Photo Booth library are backed up if you keep local originals."
    echo "- Confirm browser profile sync status (Firefox/Chrome/Brave) or include local profile folders."
    echo "- Export MFA/recovery codes, SSH/GPG keys, and any license files not tied to an account."
    echo "- Keep a copy of this folder: ${OUT_DIR}."
  } > "${REPORT_MD}"

  echo "Scan complete."
  echo "Report: ${REPORT_MD}"
  echo "Paths list: ${PATHS_FILE}"
}

run_backup() {
  if [ -z "${DEST_ROOT}" ]; then
    echo "Usage: $0 backup /path/to/backup_destination"
    exit 1
  fi

  if [ ! -d "${DEST_ROOT}" ]; then
    echo "Destination does not exist: ${DEST_ROOT}"
    exit 1
  fi

  # Ensure scan artifacts exist in this run.
  collect_scan

  BACKUP_BASE="${DEST_ROOT}/mac_migration_backup_${TS}"
  mkdir -p "${BACKUP_BASE}"

  echo "Starting backup to: ${BACKUP_BASE}"
  echo "Log: ${RSYNC_LOG}"

  while IFS= read -r rel; do
    [ -z "${rel}" ] && continue
    src="${USER_HOME}/${rel}"
    dst_parent="${BACKUP_BASE}/$(dirname "${rel}")"
    mkdir -p "${dst_parent}"
    if [ -e "${src}" ]; then
      rsync -aE --human-readable --stats "${src}" "${dst_parent}/" >> "${RSYNC_LOG}" 2>&1 || true
    fi
  done < "${PATHS_FILE}"

  cp "${REPORT_MD}" "${BACKUP_BASE}/"
  cp "${PATHS_FILE}" "${BACKUP_BASE}/"

  echo "Backup complete."
  echo "Backup folder: ${BACKUP_BASE}"
}

case "${MODE}" in
  scan)
    collect_scan
    ;;
  backup)
    run_backup
    ;;
  *)
    echo "Usage: $0 [scan|backup] [backup_destination]"
    exit 1
    ;;
esac
