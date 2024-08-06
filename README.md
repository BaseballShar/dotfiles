# Migration guide

# Pre
- Install iTerm2: As backup terminal
- Install homebrew
- Install nerdfont: CodeNewRoman Nerd Font
- Install languages: node, go
`brew install node yarn go ghcup`

# Useful command line tools
- ag
- bat
- btop
- eza
- fastfetch
- fd
- fish
- fzf
- gdu
- git-delta
- lazygit
- neovim
- rg
- starship
- stow
- tig
- tmux
- yazi
- yt-dlp
- zoxide

# Dotfiles
- Install `stow` for managing symlinks
- Clone the dotfiles repo to `~/dotfiles`
- Run `git clone https://github.com/BaseballShar/dotfiles` in ~
- Run `stow .` to symlink

# Zsh
- Use zsh as backup shell and work shell
- Install oh-my-zsh via `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Remove the updated .zshrc and symlink using stow
- Run `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- Run `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

# Vim
- Install Vim-plug via `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- Install plugins using `:PlugInstall` in vim command mode

# Nvim
- Currently using 0.10
- Formatters: `brew install prettier stylua autopep8 taplo`
- Install config via `git clone https://github.com/BaseballShar/nvim-config`

# GUI Applications
- Install hyperkey: Exclude shift in capslock
- Unbind capslock in settings
- `brew install --cask kitty amethyst hyperkey firefox thor`
