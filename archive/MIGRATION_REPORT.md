# Mac Migration Report

Generated: Fri Feb 20 15:25:05 MST 2026
Host: Michael’s MacBook Air
User: michaelrowland
macOS: 15.7.3 (24G419)

## Executive Summary
Use the transfer set below. This prioritizes user data, app state, credentials, and shell/dev config.
macOS privacy controls may block direct reads of some folders (for example Photos library); these are called out below.

## Recommended Transfer Paths

| Path | Present | Size |
|---|---:|---:|
| Desktop | yes | 8.0K |
| Documents | yes | 8.0K |
| Downloads | yes | 16K |
| Movies | yes | 28K |
| Music | yes | 604M |
| Pictures | yes | 8.0K |
| Applications | yes | 1.1M |
| Library/CloudStorage | yes | 8.0K |
| Library/Mobile Documents | yes | 3.0G |
| Library/Application Support | yes | 19G |
| Library/Group Containers | yes | 689M |
| Library/Preferences | yes | 5.9M |
| Library/Safari | yes | permission-limited |
| Library/Mail | yes | permission-limited |
| Library/Messages | yes | permission-limited |
| Library/Calendars | yes | permission-limited |
| Library/Reminders | yes | permission-limited |
| Library/Keychains | yes | 34M |
| Library/LaunchAgents | yes | 24K |
| .ssh | yes | 44K |
| .gnupg | yes | 72K |
| .aws | yes | 8.0K |
| .docker | yes | 17M |
| .config | yes | 596M |
| .codex | yes | 684K |
| .claude | yes | 151M |
| .claude.json | yes | 28K |
| .gitconfig | yes | 4.0K |
| .zshrc | yes | 8.0K |
| .zprofile | yes | 4.0K |
| .zshenv | yes | 4.0K |
| .oh-my-zsh | yes | 20M |
| .nvm | yes | 427M |
| .npm | yes | 32M |
| .local | yes | 1.9G |

## Usually Optional / Rebuildable

| Path | Present | Size |
|---|---:|---:|
| .cache | yes | 2.2G |
| Library/Caches | yes | 1.9G |
| Library/Logs | yes | 188K |
| Library/Saved Application State | yes | 56K |

## Largest App Data (Application Support)

```text
9.2G	/Users/michaelrowland/Library/Application Support/Autodesk
4.2G	/Users/michaelrowland/Library/Application Support/Firefox
1.0G	/Users/michaelrowland/Library/Application Support/Slack
1.0G	/Users/michaelrowland/Library/Application Support/Code
593M	/Users/michaelrowland/Library/Application Support/Zed
513M	/Users/michaelrowland/Library/Application Support/BraveSoftware
406M	/Users/michaelrowland/Library/Application Support/com.raycast.macos
336M	/Users/michaelrowland/Library/Application Support/discord
219M	/Users/michaelrowland/Library/Application Support/Caches
210M	/Users/michaelrowland/Library/Application Support/zoom.us
179M	/Users/michaelrowland/Library/Application Support/Spotify
139M	/Users/michaelrowland/Library/Application Support/obsidian
128M	/Users/michaelrowland/Library/Application Support/Google
119M	/Users/michaelrowland/Library/Application Support/jack
104M	/Users/michaelrowland/Library/Application Support/Microsoft
 89M	/Users/michaelrowland/Library/Application Support/GitKrakenCLI
 72M	/Users/michaelrowland/Library/Application Support/Postgres
 27M	/Users/michaelrowland/Library/Application Support/com.tinyapp.TablePlus
 25M	/Users/michaelrowland/Library/Application Support/Raindrop.io
9.3M	/Users/michaelrowland/Library/Application Support/vscode-sqltools
9.1M	/Users/michaelrowland/Library/Application Support/1Password
8.1M	/Users/michaelrowland/Library/Application Support/virtualenv
7.5M	/Users/michaelrowland/Library/Application Support/MongoDB Compass
7.3M	/Users/michaelrowland/Library/Application Support/Setapp
6.8M	/Users/michaelrowland/Library/Application Support/Chef Workstation App
6.6M	/Users/michaelrowland/Library/Application Support/com.apple.ProtectedCloudStorage
3.7M	/Users/michaelrowland/Library/Application Support/com.apple.ap.promotedcontentd
3.3M	/Users/michaelrowland/Library/Application Support/Sublime Text
3.3M	/Users/michaelrowland/Library/Application Support/PrusaSlicer
2.7M	/Users/michaelrowland/Library/Application Support/cura
```

## Largest Group Containers

```text
427M	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.Office
174M	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.com.microsoft.teams
 58M	/Users/michaelrowland/Library/Group Containers/2BUA8C4S2C.com.1password
 11M	/Users/michaelrowland/Library/Group Containers/group.com.apple.icloudMCCKit
5.3M	/Users/michaelrowland/Library/Group Containers/JLMPQHK86H.com.culturedcode.ThingsMac
3.5M	/Users/michaelrowland/Library/Group Containers/group.com.apple.storekit
3.4M	/Users/michaelrowland/Library/Group Containers/75TY9UT8AY.com.TickTick.task.mac
1.8M	/Users/michaelrowland/Library/Group Containers/9K33E3U3T4.net.shinyfrog.bear
1.1M	/Users/michaelrowland/Library/Group Containers/group.com.apple.siri.sirisuggestions
1.0M	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.OfficePPTWidget
680K	/Users/michaelrowland/Library/Group Containers/243LU875E5.groups.com.apple.podcasts
468K	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.OneDriveStandaloneSuite
388K	/Users/michaelrowland/Library/Group Containers/group.com.apple.GenerativePlayground
284K	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.OfficeWordWidget
140K	/Users/michaelrowland/Library/Group Containers/group.com.docker
 88K	/Users/michaelrowland/Library/Group Containers/group.is.workflow.shortcuts
 84K	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.OfficeExcelWidget
 84K	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.com.microsoft.oneauth
 68K	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.ms
 36K	/Users/michaelrowland/Library/Group Containers/N4RA379GBW.com.busymac.busycal3
 12K	/Users/michaelrowland/Library/Group Containers/SY64MV22J9.com.raycast.macos.shared
 12K	/Users/michaelrowland/Library/Group Containers/group.is.workflow.my.app
 12K	/Users/michaelrowland/Library/Group Containers/group.com.apple.FileProvider.DomainCaching
 12K	/Users/michaelrowland/Library/Group Containers/group.com.apple.CoreSpeech
8.0K	/Users/michaelrowland/Library/Group Containers/UBF8T346G9.OfficeOneDriveSyncIntegration
8.0K	/Users/michaelrowland/Library/Group Containers/S3DD273774.com.todoist.mac.Todoist.extensions
8.0K	/Users/michaelrowland/Library/Group Containers/group.tvappservices.container
8.0K	/Users/michaelrowland/Library/Group Containers/group.com.apple.siri.GMSSELFIngestor
8.0K	/Users/michaelrowland/Library/Group Containers/group.com.apple.icloud.fm
8.0K	/Users/michaelrowland/Library/Group Containers/74J34U3R6X.com.apple.iWork
```

## Launch Agents

```text
com.google.GoogleUpdater.wake.plist
com.google.keystone.agent.plist
com.google.keystone.xpcservice.plist
com.user.gittodo.commit.plist
com.user.gittodo.push.plist
homebrew.mxcl.mysql.plist
```

## Non-Apple Preference Files (Sample)

```text
/Users/michaelrowland/Library/Preferences/APMAnalyticsSuiteName.plist
/Users/michaelrowland/Library/Preferences/APMExperimentSuiteName.plist
/Users/michaelrowland/Library/Preferences/Avatar Cache Index.plist
/Users/michaelrowland/Library/Preferences/com.1password.1password.plist
/Users/michaelrowland/Library/Preferences/com.autodesk.AdskIdentityManager.plist
/Users/michaelrowland/Library/Preferences/com.autodesk.EAGLE 9.7.0.plist
/Users/michaelrowland/Library/Preferences/com.autodesk.fusion360.plist
/Users/michaelrowland/Library/Preferences/com.autodesk.FusionApp.plist
/Users/michaelrowland/Library/Preferences/com.brave.Browser.plist
/Users/michaelrowland/Library/Preferences/com.elasticvue.app.plist
/Users/michaelrowland/Library/Preferences/com.electron.dockerdesktop.plist
/Users/michaelrowland/Library/Preferences/com.firebase.FIRInstallations.plist
/Users/michaelrowland/Library/Preferences/com.google.Chrome.plist
/Users/michaelrowland/Library/Preferences/com.google.gmp.measurement.monitor.plist
/Users/michaelrowland/Library/Preferences/com.google.Keystone.Agent.plist
/Users/michaelrowland/Library/Preferences/com.hnc.Discord.helper.Renderer.plist
/Users/michaelrowland/Library/Preferences/com.hnc.Discord.plist
/Users/michaelrowland/Library/Preferences/com.knollsoft.Rectangle.plist
/Users/michaelrowland/Library/Preferences/com.launchdarkly.client.oblZDIeMALJOnMHlW2ZbbaH7ETbIrCwcHE8QmZg5Fss=.ep3i+MWE0vetb9ud3g2haurZqSdOCkUThfESU371ttU=.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.autoupdate.fba.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.autoupdate2.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.office.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.shared.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.SharePoint-mac.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.teams2.helper.plist
/Users/michaelrowland/Library/Preferences/com.microsoft.VSCode.plist
/Users/michaelrowland/Library/Preferences/com.mitchellh.ghostty.plist
/Users/michaelrowland/Library/Preferences/com.mongodb.compass.plist
/Users/michaelrowland/Library/Preferences/com.obsproject.obs-studio.plist
/Users/michaelrowland/Library/Preferences/com.postgresapp.Postgres2.plist
/Users/michaelrowland/Library/Preferences/com.postgresapp.Postgres2MenuHelper.plist
/Users/michaelrowland/Library/Preferences/com.qtproject.plist
/Users/michaelrowland/Library/Preferences/com.raycast.macos.plist
/Users/michaelrowland/Library/Preferences/com.segment.storage.ewjp2RGpYO4hHSErQ3lBOOjnR0YqolJo.plist
/Users/michaelrowland/Library/Preferences/com.setapp.DesktopClient.plist
/Users/michaelrowland/Library/Preferences/com.setapp.DesktopClient.SetappLauncher.plist
/Users/michaelrowland/Library/Preferences/com.spotify.client.plist
/Users/michaelrowland/Library/Preferences/com.sublimetext.4.plist
/Users/michaelrowland/Library/Preferences/com.tinyapp.TablePlus.plist
/Users/michaelrowland/Library/Preferences/com.tinyspeck.slackmacgap.plist
/Users/michaelrowland/Library/Preferences/ContextStoreAgent.plist
/Users/michaelrowland/Library/Preferences/dev.zed.Zed.plist
/Users/michaelrowland/Library/Preferences/diagnostics_agent.plist
/Users/michaelrowland/Library/Preferences/familycircled.plist
/Users/michaelrowland/Library/Preferences/fm.qmk.toolbox.plist
/Users/michaelrowland/Library/Preferences/group.com.apple.mail.plist
/Users/michaelrowland/Library/Preferences/icloudmailagent.plist
/Users/michaelrowland/Library/Preferences/io.raindrop.macapp.plist
/Users/michaelrowland/Library/Preferences/loginwindow.plist
/Users/michaelrowland/Library/Preferences/mbuseragent.plist
/Users/michaelrowland/Library/Preferences/md.obsidian.plist
/Users/michaelrowland/Library/Preferences/MiniLauncher.plist
/Users/michaelrowland/Library/Preferences/MobileMeAccounts.plist
/Users/michaelrowland/Library/Preferences/org.cups.PrintingPrefs.plist
/Users/michaelrowland/Library/Preferences/org.m0k.transmission.plist
/Users/michaelrowland/Library/Preferences/org.mozilla.firefox.plist
/Users/michaelrowland/Library/Preferences/org.pqrs.Karabiner-Elements.Settings.plist
/Users/michaelrowland/Library/Preferences/org.pqrs.Karabiner-EventViewer.plist
/Users/michaelrowland/Library/Preferences/org.pqrs.Karabiner-Updater.plist
/Users/michaelrowland/Library/Preferences/org.sparkle-project.Sparkle.Autoupdate.plist
/Users/michaelrowland/Library/Preferences/org.videolan.vlc.plist
/Users/michaelrowland/Library/Preferences/pbs.plist
/Users/michaelrowland/Library/Preferences/pl.maketheweb.cleanshotx.plist
/Users/michaelrowland/Library/Preferences/replayd.plist
/Users/michaelrowland/Library/Preferences/sh.chef.chef-workstation.plist
/Users/michaelrowland/Library/Preferences/sharedfilelistd.plist
/Users/michaelrowland/Library/Preferences/SKGActivityJournal.plist
/Users/michaelrowland/Library/Preferences/systemgroup.com.apple.icloud.searchpartyd.sharedsettings.plist
/Users/michaelrowland/Library/Preferences/us.zoom.updater.config.plist
/Users/michaelrowland/Library/Preferences/us.zoom.updater.plist
/Users/michaelrowland/Library/Preferences/us.zoom.xos.plist
/Users/michaelrowland/Library/Preferences/us.zoom.ZoomAutoUpdater.plist
/Users/michaelrowland/Library/Preferences/us.zoom.ZoomClips.plist
/Users/michaelrowland/Library/Preferences/ZoomChat.plist
```

## Package Managers

```text
brew installed: yes

brew leaves:
autossh
bat
coreutils
csvkit
databricks/tap/databricks
docker
duckdb
exiftool
ffmpeg
fish
fnm
fzf
gh
go
graphviz
htop
jpeg
just
lzip
mkcert
mongocli
mongodb/brew/mongodb-community
mysql
nats-streaming-server
neovim
nginx
nushell
nvm
openvino
pandoc
pipx
postgis
postgresql@14
python-oauthlib
python-requests
python@3.10
python@3.11
python@3.12
qmk/qmk/qmk
rename
repomix
saulpw/vd/visidata
sqlcmd
terminal-notifier
tmux
tw93/tap/mole
wget
yarn
yt-dlp
zx

brew casks:
1password-cli
basictex
chef-workstation
codex
font-ibm-plex-sans
font-jetbrains-mono
gcloud-cli
ghostty
google-cloud-sdk
linear-linear
openscad
qmk-toolbox
telegram
zed
```

## Manual Checklist Before Wipe

- Verify cloud providers are fully synced (iCloud Drive, OneDrive).
- Confirm Photos library and Photo Booth library are backed up if you keep local originals.
- Confirm browser profile sync status (Firefox/Chrome/Brave) or include local profile folders.
- Export MFA/recovery codes, SSH/GPG keys, and any license files not tied to an account.
- Keep a copy of this folder: /Users/michaelrowland/migration_audit_20260220_152505.
