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

# Linux Server
## Debian (Bash)
- Clone dotfiles `git clone https://github.com/BaseballShar/dotfiles` in ~
- Install vim plug `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- Install OMB `bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"`
- Run `sudo apt install stow`
- Run `stow .` and resolve existing symlink conflicts
- Install go `sudo apt install golang`
- Install rust `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- [Pending] Include common packages for installation as a script
- [Pending] Create a bashrc with aliases
