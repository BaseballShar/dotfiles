echo "Checking Homebrew"
if which brew >/dev/null; then
  echo "Homebrew is installed"
else
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # setting homebrew in path
  echo >>~/.zprofile
  echo 'eval "$(/usr/local/bin/brew shellenv)"' >>~/.zprofile
  eval "$(/usr/local/bin/brew shellenv)"
fi
echo ""

echo "Installing Brew Package"
brew bundle
echo ""

echo "Checking Oh-My-Zsh"
if [[ -e ~/.oh-my-zsh ]]; then
  echo "Oh-My-Zsh is installed"
else
  echo "Installing Oh-My-Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
echo ""

OMZ_PLUGINS=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)
echo "Checking Oh-My-Zsh plugins"
for plugin in ${OMZ_PLUGINS[@]}; do
  if [[ -e ~/.oh-my-zsh/custom/plugins/$plugin ]]; then
    echo "$plugin is installed"
  else
    echo "Installing $plugin"
    git clone https://github.com/zsh-users/$plugin ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin
  fi
done
echo ""

# symlink dotfiles
echo "Begin symlinking dotfiles"
# backup zsh config
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
fi
cd ~/dotfiles
stow .
echo "End of installation script"

# start services
brew services start sketchybar
brew services start svim
