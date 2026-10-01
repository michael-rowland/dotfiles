#!/usr/bin/env bash
# Set default applications for file types via duti
# Requires: brew install duti

set -euo pipefail

duti -s dev.zed.Zed .conf  all
duti -s dev.zed.Zed .js    all
duti -s dev.zed.Zed .json  all
duti -s dev.zed.Zed .log   all
duti -s dev.zed.Zed .md    all
duti -s dev.zed.Zed .py    all
duti -s dev.zed.Zed .sh    all
duti -s dev.zed.Zed .sql   all
duti -s dev.zed.Zed .svelte all
duti -s dev.zed.Zed .yaml  all
duti -s dev.zed.Zed .yml   all
duti -s dev.zed.Zed public.plain-text all

for file in "$HOME/Brewfile" "$HOME/Dockerfile" "$HOME/Makefile"; do
  if [[ -f "$file" ]]; then
    xattr -w com.apple.LaunchServices.OpenWith dev.zed.Zed "$file"
  fi
done

echo "Done setting default applications."
