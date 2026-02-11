# dotconfig

My standard configuration files

## Usage

### Bootstrap

`chezmoi` and `git` are required for initial setup. `git-credential-helper` can manage credentials securely using your platform's credential storage.

```
nix profile add nixpkgs#git nixpkgs#git-credential-manager nixpkgs#chezmoi

git config --global credential.helper manager
git config --global user.name "jtaguchi"
git config --global user.email "12386296+jtaguchi@users.noreply.github.com"
```

### Initial setup

```
chezmoi init --apply --verbose https://github.com/jtaguchi/dotfiles.git
```

### Apply updates

#### Option 1: Pull latest and apply
```
chezmoi -v update
```

#### Option 2: Pull latest but apply separately
```
chezmoi git pull -- --autostash --rebase && chezmoi diff
chezmoi -v apply
```
