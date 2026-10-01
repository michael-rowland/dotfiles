# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Fresh install

```bash
git clone https://github.com/michael-rowland/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` does the following:
1. Installs Homebrew (if missing)
2. Installs all packages and apps from `Brewfile`
3. Symlinks configs into `~` via `stow`
4. Applies macOS system preferences (`macos/defaults.sh`)
5. Sets default file type associations (`macos/duti.sh`)

## Manual steps

These can't (yet) be automated:

- [ ] Sign in to 1Password
- [ ] Sign in to Raycast (and import scripts from `raycast/`)
- [ ] Sign in to Firefox; set as default browser
- [ ] `gh auth login` — authenticate GitHub CLI
- [ ] `ssh -T git@github.com` — verify GitHub SSH works
- [ ] System Settings → Notifications (configure per-app)
- [ ] System Settings → Displays → set zoom/resolution
- [ ] Turn off autocorrect (System Settings → Keyboard → Text Input)
- [ ] Turn off "Warn when opening downloaded apps"
- [ ] Sign in to Spotify, VLC, Discord, etc.
- [ ] Clone repos from `~/code/`
- [ ] Copy `~/.ssh/`, `~/.aws/credentials`, `~/.config/gcloud/`, `~/.databrickscfg` (secrets — not tracked in this repo)
- [ ] Re-authenticate GCP: `gcloud auth login` and `gcloud auth application-default login`

## Structure

Each top-level directory is a [Stow package](https://www.gnu.org/software/stow/manual/stow.html). Running `stow <package>` from `~/dotfiles` creates symlinks in `$HOME` mirroring the package's directory tree.

| Package | Symlinks to |
|---|---|
| `zsh/` | `~/.zshrc`, `~/.zshenv`, `~/.zprofile` |
| `ghostty/` | `~/.config/ghostty/` |
| `zed/` | `~/.config/zed/` |
| `yt-dlp/` | `~/.config/yt-dlp/` |
| `karabiner/` | `~/.config/karabiner/` |
| `aws/` | `~/.aws/` |
| `claude/` | `~/.claude/settings.json` |
| `git/` | `~/.gitconfig`, `~/.config/git/ignore` |

## File type associations

`macos/duti.sh` makes every text-ish file open in Zed.

macOS associates files by UTI, not extension, and an extension only has a UTI
if some installed app declares one. Extensions nothing declares (`.lua`,
`.svelte`, `.nix`, `.conf`) get a *dynamic* UTI that doesn't conform to
`public.plain-text`, so a plain-text default never catches them and `duti`
can't bind them.

To work around that, `macos/mkhelper/build.sh` installs a no-op app at
`~/Applications/Text UTI Helper.app` whose only job is to *declare* those
extensions as plain-text subtypes. It declares no document types — that would
make the helper win the association instead of Zed.

Two gotchas worth remembering:

- A full `lsregister -r` rebuild **discards** duti's overrides, so `duti.sh`
  only re-registers specific bundles.
- `.ts` maps to `public.mpeg-2-transport-stream`, so it's bound by extension
  to avoid sending real video files to Zed.

To add an extension, add it to `EXTS` in `mkhelper/build.sh` **and**
`helper_exts` in `duti.sh`, then re-run `bash macos/duti.sh`.

## Adding a new config

```bash
# Create the stow package structure
mkdir -p ~/dotfiles/<package>/.config/<package>

# Move the live config into the repo
mv ~/.config/<package>/config ~/dotfiles/<package>/.config/<package>/config

# Stow it (creates the symlink back)
cd ~/dotfiles && stow <package>

# Add it to install.sh stow line
```
