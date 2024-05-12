# <--- Alias --->
# Quick access to common directory
alias doc='cd /Users/chanjason/Documents/Something'
alias des='cd /Users/chanjason/Desktop'

# Alias for modern linux commands
alias b='btop'
alias c='__zoxide_z'
alias ci='__zoxide_zi'
alias lv='lvim'
alias nvi='nvim'

# Run anything from anywhere
function run
  # Search for code dir and file
  set -l dir (ls ~/Documents/Code | fzf)
  set -l path ~/Documents/Code/$dir
  set -l file (find $path -type f | fzf)
  switch $dir
  # Invoke different interprets based on file extension
  case Python
    python $file
  case Javascript
    node $file
  case Lua
    lua $file
  case '*'
    echo "The user is too lazy to add more interpret support"
  end
end

# Quickly jumps to a code directory
# First select a coding language
# Then fzf search for files to edit
function code
  set -l dir (ls ~/Documents/Code | fzf)
  set -l path ~/Documents/Code/$dir
  cd $path
  find $path -type f | fzf | xargs nvim
end

# Listen to musics using the power of fzf
function mu
  find ~/Documents/Music -type f | fzf | xargs open
end

# Editing configs is easier than ever
function ed
  switch $argv
  case sh fish shell
    nvim ~/.config/fish/*.fish
  case nv nvim
    nvim ~/.config/nvim/*.vim ~/.config/nvim/lua/*.lua ~/.config/nvim/lua/plugins/*.lua
  case kit kitty
    nvim ~/.config/kitty/kitty.conf
  case vm vifm
    nvim ~/.config/vifm/vifmrc
  case tm tmux
    nvim ~/.tmux.conf
  case h help
    echo "ed: Shortcut for editing configs"
    echo "Usage: ed [sh|nv|kit|vm]"
    echo "No argument: Fuzzy search all configs"
    echo "sh: Edit shell config"
    echo "nv: Edit nvim config"
    echo "kit: Edit kitty config"
    echo "vm: Edit vifm config"
  case "*"
    find ~/dotfiles -type f | fzf -m | xargs nvim
  end
end

# A useful wrapper for nvim w/f fzf integration
function nv
  if test (count $argv) -eq 0
    nvim $(fzf)
  else
    nvim $argv
  end
end

# A convenient wrapper for tmux
function tm
  # No arguments supplied
  if test (count $argv) -eq 0
    if tmux ls >/dev/null
      tmux a
    else
      tmux
    end
  # Arguments supplied
  else
    switch $argv[1]
    # List all tmux sessions
    case h help
      echo "tm: A convenient wrapper for tmux"
      echo "Usage: tm [l|k|ka|*]"
      echo "l: List all tmux sessions"
      echo "k: Kill session by name"
      echo "ka: Kill all sessions"
      echo "*: Spawn or join a new session with name"
    case l ls
      tmux ls
    # Kill session by name
    case k kill
      tmux kill-session -t $argv[2]
    # Kill all sessions
    case ka killall
      tmux kill-server
    # Spawn or join a new session with name
    case "*"
      if tmux has-session -t $argv >/dev/null
        tmux a -t $argv[1]
      else
        tmux new -s $argv[1]
      end
    end
  end
end

function fish_greeting
  echo "Welcome back, Fisher Baseball!"
end

# Do not print vim mode on prompt
function fish_vi_mode_prompt
end

# General Alias
alias vd='nvim -d'

alias p='pwd'
alias pp='pwd -P'

alias o='open .'

alias gdu='gdu-go'

alias todo='nvim ~/vimwiki/index.md'

# alias rip='rip --graveyard ~/.local/share/Trash'

# Alias for git
abbr -a tiga 'tig --all'
abbr -a --position anywhere gaa 'git add --all'
abbr -a --position anywhere gb 'git branch'
abbr -a --position anywhere gba 'git branch --all | less -F'
abbr -a --position anywhere gc 'git commit'
abbr -a --position anywhere gcm 'git commit --message'
abbr -a --position anywhere gco 'git checkout'
abbr -a --position anywhere gd 'git diff'
abbr -a --position anywhere gdca 'git diff --cached'
abbr -a --position anywhere gdcas 'git diff --cached --stat'
abbr -a --position anywhere gds 'git diff --stat'
abbr -a --position anywhere gf 'git fetch'
abbr -a --position anywhere gst 'git status'
abbr -a --position anywhere gp 'git push'
abbr -a --position anywhere gl 'git pull'
abbr -a --position anywhere grhh 'git reset --hard'
abbr -a --position anywhere gr 'git reset'

alias Gst='git status'

# Alias for ls
alias l='exa -F --sort=type'
alias ll='exa -lh --time-style=iso --no-user --sort=type'
alias la='exa -lha --time-style=long-iso --sort=type'
alias lt='exa -T --sort=type'

# Alias for programming languages
alias py='python3'
alias ipy='ipython'

alias vm='vifm .'

# Alias for rebooting zsh shell
alias rb='source ~/.config/fish/config.fish'

alias tt='ttyper'

# Backup zsh and vim configs
# cp file ~/backup (file)
# cp -r dir ~/backup (folder)
function cfgbackup
    cp ~/.zshrc ~/Backup
    cp ~/.vimrc ~/Backup
    cp -r ~/.config/zsh ~/Backup
    cp -r ~/.config/fish ~/Backup
    cp -r ~/.config/vifm ~/Backup
    cp -r ~/.config/nvim ~/Backup
    cp -r ~/.config/lvim ~/Backup
end

function cfgrecover
    cp -rf ~/Backup/nvim ~/.config
end

# Download music from a secret platform
function ytdl
  cd ~/Downloads
  mkdir music
  cd music
  youtube-dl -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" 'https://www.youtube.com/playlist?list=PLN0FTc65cafjUNGRyfsfdBaMW8P0W6qh7'
end

# Initialisation
zoxide init fish | source
# starship init fish | source
