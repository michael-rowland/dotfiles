#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Firefox Synced Tabs to Clipboard
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🦊

# export tabs="$(sqlite3 ${HOME}/Library/Containers/com.apple.Safari/Data/Library/Safari/CloudTabs.db 'select url from cloud_tabs order by position desc;')"

sqlite3 ${HOME}/Library/Application\ Support/Firefox/Profiles/*.default-release/synced-tabs.db "SELECT json_extract(tabs_unnested.value, '$.urlHistory[0]') FROM tabs AS t, json_each(t.record, '$.tabs') AS tabs_unnested;" | pbcopy

# for url in $tabs; do open $url; done