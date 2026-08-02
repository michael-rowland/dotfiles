#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Safari Synced Tabs to Clipboard
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📥

# export tabs="$(sqlite3 ${HOME}/Library/Containers/com.apple.Safari/Data/Library/Safari/CloudTabs.db 'select url from cloud_tabs order by position desc;')"

sqlite3 ${HOME}/Library/Containers/com.apple.Safari/Data/Library/Safari/CloudTabs.db 'select url from cloud_tabs;' | pbcopy

# for url in $tabs; do open $url; done