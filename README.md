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
