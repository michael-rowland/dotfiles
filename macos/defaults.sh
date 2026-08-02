#!/usr/bin/env bash
# macOS system preferences — run on a fresh machine, then:
#   killall Dock && killall Finder
# https://macos-defaults.com/

set -euo pipefail

sudo -v

###############################################################################
# Dock                                                                        #
###############################################################################

# Autohide the Dock
defaults write com.apple.dock autohide -bool true

# Position on left
defaults write com.apple.dock orientation -string "left"

# Icon size 33px
defaults write com.apple.dock tilesize -int 33

# Don't show recent applications
defaults write com.apple.dock show-recents -bool false

# Hide process indicators (dots under running apps)
defaults write com.apple.dock show-process-indicators -bool false

# Show only active applications (hide persistent/pinned icons)
defaults write com.apple.dock "static-only" -bool "true"

###############################################################################
# Keyboard                                                                    #
###############################################################################

# Fastest key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Short delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

###############################################################################
# Finder                                                                      #
###############################################################################

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Turn off warning when changing a file extension.
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false

# List view style
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

# "Calculate all sizes" checkbox in View Options (Cmd+J). This lives in nested
# dicts, so `defaults write` can't set it directly — use PlistBuddy instead.
FINDER_PLIST="${HOME}/Library/Preferences/com.apple.finder.plist"
for scope in StandardViewSettings FK_StandardViewSettings; do
  for view in ListViewSettings ExtendedListViewSettingsV2; do
    /usr/libexec/PlistBuddy -c "Set :${scope}:${view}:calculateAllSizes true" "$FINDER_PLIST" 2>/dev/null \
      || /usr/libexec/PlistBuddy -c "Add :${scope}:${view}:calculateAllSizes bool true" "$FINDER_PLIST" 2>/dev/null \
      || true
  done
done
killall cfprefsd

###############################################################################
# General UI                                                                  #
###############################################################################

# Show scroll bars only when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# https://github.com/krikchaip/dotfiles/blob/ffdb64222b6980a3c327084c6c21d59ddf25161b/home/.chezmoiscripts/run_onchange_system-settings.sh#L218-L219
# https://flaky.build/backup-your-macos-keyboard-shortcuts-from-command-line/
function key-disable() {
  local TEMPLATE="<dict><key>enabled</key><false/></dict>"
  echo "$TEMPLATE"
}

# CLEAN UP
echo "Disabling Spotlight shortcuts..."
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "$(key-disable)"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "$(key-disable)"

/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

osascript -e 'tell application "System Events" to tell every desktop to set picture to "~/dotfiles/wallpapers/spirals/aqua-desktop.png"'

# Set default Finder window to Downloads
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false

###############################################################################
# Continuity / Handoff                                                        #
###############################################################################

# Disable iPhone cellular calls on Mac (DisableCallRelay is what System Settings writes)
defaults write com.apple.FaceTime DisableCallRelay -bool true
defaults write com.apple.FaceTime PhoneMobileContinuity -bool false
killall callservicesd 2>/dev/null || true

###############################################################################
# Apply changes                                                               #
###############################################################################

echo "Restarting Dock and Finder to apply changes..."
killall Dock
killall Finder

echo "Done. Some changes may require a logout to take effect."
