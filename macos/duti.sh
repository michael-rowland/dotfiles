#!/usr/bin/env bash
# Set default applications for file types via duti, so every text-ish file
# opens in Zed.
#
# Requires: brew install duti
#
# Background — why this is more than a list of `duti -s` calls:
#
# macOS associates files by UTI, not by extension. An extension only has a
# UTI if some installed app (or macOS itself) declares one. For extensions
# nothing declares — .lua, .svelte, .nix, .conf — macOS invents a *dynamic*
# UTI (dyn.*) that does NOT conform to public.plain-text. So a plain-text
# default never catches them, and `duti` fails with "error -50" because
# there is no real type to bind.
#
# Fix: macos/mkhelper/build.sh installs a tiny no-op app that *declares*
# those extensions as public.plain-text subtypes. It deliberately declares
# no CFBundleDocumentTypes — declaring the types is enough, and claiming to
# handle them would make the helper itself win the association.
#
# Ordering matters: the helper must be built and registered BEFORE its
# local.texttype.* UTIs can be bound to Zed.

set -euo pipefail

ZED="dev.zed.Zed"
HELPER="$HOME/Applications/Text UTI Helper.app"

# ---------------------------------------------------------------------------
# 1. Install/refresh the helper that declares otherwise-untyped extensions.
# ---------------------------------------------------------------------------
bash "$(dirname "${BASH_SOURCE[0]}")/mkhelper/build.sh" "$HELPER" >/dev/null
echo "==> Registered text UTI helper"

# ---------------------------------------------------------------------------
# 2. Standard system UTIs that Zed should own.
# ---------------------------------------------------------------------------
# Deliberately NOT bound:
#   public.html  — .html should open in a browser for viewing
system_utis=(
  public.plain-text
  public.utf8-plain-text
  public.utf16-plain-text
  public.text
  public.source-code
  public.script
  public.shell-script
  public.zsh-script
  public.bash-script
  public.python-script
  public.perl-script
  public.ruby-script
  public.php-script
  public.swift-source
  public.c-source
  public.c-header
  public.c-plus-plus-source
  public.c-plus-plus-header
  public.objective-c-source
  public.assembly-source
  public.json
  public.yaml
  public.css
  public.xml
  public.make-source
  public.patch-file
  public.comma-separated-values-text
  public.tab-separated-values-text
  public.delimited-values-text
  net.daringfireball.markdown
  com.netscape.javascript-source
  com.apple.property-list
  com.apple.log
  com.apple.crashreport
)

for uti in "${system_utis[@]}"; do
  duti -s "$ZED" "$uti" all 2>/dev/null || true
done
echo "==> Bound system text UTIs"

# ---------------------------------------------------------------------------
# 3. Custom UTIs from the helper (must come after step 1).
# ---------------------------------------------------------------------------
# Keep this list in sync with EXTS in mkhelper/build.sh.
helper_exts=(
  bash cfg cjs cmake conf csh editorconfig env fish gitattributes
  gitconfig gitignore gradle graphql hcl ini jsonc kt lua mdx mjs mts
  nix properties proto scala scss sql svelte tf tfvars tsv vue zig zsh
)

for ext in "${helper_exts[@]}"; do
  duti -s "$ZED" "local.texttype.$ext" all 2>/dev/null || true
done
echo "==> Bound helper-declared UTIs"

# ---------------------------------------------------------------------------
# 4. Extensions bound directly, bypassing their UTI.
# ---------------------------------------------------------------------------
# .ts maps to public.mpeg-2-transport-stream (MPEG video), so binding that
# UTI would send real video files to Zed. Bind the extension only.
direct_exts=( ts toml rs go rb jsx tsx md markdown txt )

for ext in "${direct_exts[@]}"; do
  duti -s "$ZED" "$ext" all 2>/dev/null || true
done
echo "==> Bound individual extensions"

# ---------------------------------------------------------------------------
# 5. Nudge Finder to pick up the new associations.
# ---------------------------------------------------------------------------
# Note: a full `lsregister -r -domain local -domain system -domain user`
# rebuild re-reads every app's Info.plist and DISCARDS duti's overrides, so
# only the specific bundles are re-registered here.
LSREGISTER="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister"
"$LSREGISTER" -f /Applications/Zed.app >/dev/null 2>&1 || true
killall Finder >/dev/null 2>&1 || true

echo "Done setting default applications."
