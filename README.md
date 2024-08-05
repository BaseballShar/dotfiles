# Migration guide

# Pre
- Install homebrew
- Install iTerm2: As backup terminal
- Install nerdfont: CodeNewRoman Nerd Font
- Install languages: node, go, haskell
- script: `brew install node go ghcup`

# Clis
- fastfetch
- eza
- tig
- fish
- lazygit
- ag
- fd
- Add more later

# Dotfiles
- Install `stow` for managing symlinks
- Clone the dotfiles repo to `~/dotfiles`
- Run `git clone https://github.com/BaseballShar/dotfiles` in ~
- Run `stow .` to symlink

# Vim
- Install Vim-plug via `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- Install plugins using `:PlugInstall` in vim command mode

# Nvim
- Install nvim via `brew install neovim`
- Currently using 0.10
- Formatters: `brew install prettier stylua autopep8 taplo`

# Tmux
- Install tmux via `brew install tmux`
- The configuration should be sourced and working flawlessly

# Applications: Step 2
- Install hyperkey: Exclude shift in capslock
- Unbind capslock in settings
- Install amethyst
- `brew install --cask amethyst`

# Kitty

# Fish: As login shell
-- Delayed: Used zsh for backup
- Install fisher plugin manager
- Install these fish plugins
jorgebucaran/fisher
patrickf1/fzf.fish
jorgebucaran/autopair.fish
jhillyerd/plugin-git

# To be fixed
- Bad integration: fzf-native and fzf -> Temp fix: Use fzf to replace

# To be done
- css colour code plugin issues: Unable to build in fish
