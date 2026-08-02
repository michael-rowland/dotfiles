#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Firefox: firstEditField
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Copies `tagsField` to clipboard
# @raycast.author Michael Rowland

echo "tagsField" | pbcopy
open -a Firefox.app about:config
