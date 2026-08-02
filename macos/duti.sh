#!/usr/bin/env bash
# Set default applications for file types via duti
# Requires: brew install duti

set -euo pipefail

duti -s com.sublimetext.4 .conf  all
duti -s com.sublimetext.4 .fish  all
duti -s com.sublimetext.4 .js    all
duti -s com.sublimetext.4 .json  all
duti -s com.sublimetext.4 .log   all
duti -s com.sublimetext.4 .md    all
duti -s com.sublimetext.4 .py    all
duti -s com.sublimetext.4 .sh    all
duti -s com.sublimetext.4 .sql   all
duti -s com.sublimetext.4 .svelte all
duti -s com.sublimetext.4 .yaml  all
duti -s com.sublimetext.4 .yml   all
duti -s com.sublimetext.4 public.plain-text all

for file in "$HOME/Brewfile" "$HOME/Dockerfile" "$HOME/Makefile"; do
  if [[ -f "$file" ]]; then
    xattr -w com.apple.LaunchServices.OpenWith com.sublimetext.4 "$file"
  fi
done

echo "Done setting default applications."
