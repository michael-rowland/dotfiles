#!/usr/bin/env bash
# Build "Text UTI Helper.app" — a do-nothing app whose only purpose is to
# declare file extensions that no installed application claims.
#
# Why this is needed: macOS assigns an extension like .lua or .svelte a
# *dynamic* UTI (dyn.*) when nothing declares it. Dynamic UTIs don't inherit
# from public.plain-text, so a plain-text default never catches them and
# `duti` has no real type to bind — it fails with "error -50". Installing an
# app that declares these extensions as public.plain-text subtypes gives them
# a stable UTI, after which the normal plain-text association applies.
#
# The app is never launched; it exists only for its Info.plist.

set -euo pipefail

APP="${1:-$HOME/Applications/Text UTI Helper.app}"

# Extensions with no system- or app-provided UTI on a typical macOS install.
EXTS=(
  bash cfg cjs cmake conf csh editorconfig env fish gitattributes
  gitconfig gitignore gradle graphql hcl ini jsonc kt lua mdx mjs mts
  nix properties proto scala scss sql svelte tf tfvars tsv vue zig zsh
)

rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS"

# A minimal no-op binary so LaunchServices treats the bundle as a real app.
printf '#!/bin/sh\nexit 0\n' > "$APP/Contents/MacOS/helper"
chmod +x "$APP/Contents/MacOS/helper"

{
  cat <<'HEAD'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleIdentifier</key><string>local.text-uti-helper</string>
  <key>CFBundleName</key><string>Text UTI Helper</string>
  <key>CFBundleExecutable</key><string>helper</string>
  <key>CFBundlePackageType</key><string>APPL</string>
  <key>CFBundleShortVersionString</key><string>1.0</string>
  <key>LSUIElement</key><true/>
  <key>UTExportedTypeDeclarations</key>
  <array>
HEAD

  # Each extension becomes a concrete UTI that conforms to plain text.
  for ext in "${EXTS[@]}"; do
    cat <<DECL
    <dict>
      <key>UTTypeIdentifier</key><string>local.texttype.$ext</string>
      <key>UTTypeDescription</key><string>$ext source text</string>
      <key>UTTypeConformsTo</key>
      <array><string>public.plain-text</string><string>public.source-code</string></array>
      <key>UTTypeTagSpecification</key>
      <dict>
        <key>public.filename-extension</key><array><string>$ext</string></array>
      </dict>
    </dict>
DECL
  done

  cat <<'TAIL'
  </array>
</dict>
</plist>
TAIL
} > "$APP/Contents/Info.plist"

plutil -lint "$APP/Contents/Info.plist" >/dev/null

# Register the bundle so its type declarations take effect immediately.
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
  -f "$APP"

echo "Built and registered: $APP"
