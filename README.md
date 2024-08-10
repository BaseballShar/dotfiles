# Migration guide

# Pre-terminal setup
- Install iTerm2: As backup terminal
- Install nerdfont: CodeNewRoman Nerd Font
- Install homebrew
- Install stow via `brew install stow`

# Dotfiles
- Clone the dotfiles repo to `~/dotfiles`
- Run `git clone https://github.com/BaseballShar/dotfiles` in ~
- Run `stow .` to symlink
- Run `brew bundle` to install brew packages

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
- Install config via `git clone https://github.com/BaseballShar/nvim-config`
