# Mac Migration Handoff

Generated on: 2026-02-20
Machine: `Michael’s MacBook Air` (`macOS 15.7.3`, build `24G419`)

## Deliverables Created

- Script: `/Users/michaelrowland/mac_migration_scan.sh`
- Latest scan report: `/Users/michaelrowland/migration_audit_20260220_151207/MIGRATION_REPORT.md`
- Latest transfer-path manifest: `/Users/michaelrowland/migration_audit_20260220_151207/recommended_paths.txt`

## What You Should Transfer (This Mac)

High-priority user/config/security data found on this machine:

- `~/Library/Mobile Documents` (`3.0G`) - iCloud Drive data/state.
- `~/Library/Application Support` (`19G`) - app data and local profiles.
- `~/Library/Group Containers` (`689M`) - shared app container data (Office/Teams/1Password/etc).
- `~/Library/Keychains` (`33M`) - local keychain material.
- `~/.local` (`1.9G`) - local user binaries/tools.
- `~/.config` (`596M`) - tool/application configs.
- `~/.nvm` (`427M`) - Node versions.
- `~/Music` (`604M`) - local music data.
- `~/.claude` (`151M`) and `~/.codex` (`844K`) - local agent/tool state.
- `~/.ssh`, `~/.gnupg`, `~/.aws`, `~/.gitconfig`, `~/.zshrc`, `~/.zprofile`, `~/.zshenv`, `~/.oh-my-zsh`, `~/.npm`.

Large app-specific local data worth preserving:

- `~/Library/Application Support/Autodesk` (`9.2G`)
- `~/Library/Application Support/Firefox` (`4.2G`)
- `~/Library/Application Support/Slack` (`1.0G`)
- `~/Library/Application Support/Code` (`1.0G`)
- `~/Library/Application Support/Zed` (`593M`)
- `~/Library/Application Support/BraveSoftware` (`513M`)

## Privacy-Limited Paths (Manual Attention)

macOS privacy protections prevented full size/accounting for:

- `~/Library/Safari`
- `~/Library/Mail`
- `~/Library/Messages`
- `~/Library/Calendars`
- `~/Library/Reminders`
- `~/Pictures/Photos Library.photoslibrary`
- `~/Pictures/Photo Booth Library`

These should still be included in your transfer/backup plan.

## Usually Safe to Skip

You can usually rebuild these after restore:

- `~/.cache` (`2.2G`)
- `~/Library/Caches` (`1.9G`)
- `~/Library/Logs`
- `~/Library/Saved Application State`

## Script Usage

### 1) Re-scan (anytime)

```bash
/Users/michaelrowland/mac_migration_scan.sh scan
```

Creates a fresh folder like:

- `~/migration_audit_YYYYMMDD_HHMMSS/MIGRATION_REPORT.md`
- `~/migration_audit_YYYYMMDD_HHMMSS/recommended_paths.txt`

### 2) Run backup copy to an external drive

```bash
/Users/michaelrowland/mac_migration_scan.sh backup /Volumes/YourBackupDrive
```

This copies all recommended paths into:

- `/Volumes/YourBackupDrive/mac_migration_backup_YYYYMMDD_HHMMSS`

and writes:

- `rsync_backup.log`
- a copy of `MIGRATION_REPORT.md`
- a copy of `recommended_paths.txt`

## Recommended Final Pre-Wipe Checks

- Ensure iCloud/OneDrive are fully synced.
- Confirm browser sign-in/sync (Firefox, Chrome, Brave) or keep local profile folders.
- Export MFA recovery codes and verify password manager access.
- Verify SSH/GPG keys are readable in backup.
- Keep at least one offline copy of the backup folder before wipe.
