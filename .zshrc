# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOT_HOME="$HOME/dotfiles"
export XDG_CONFIG_HOME="$HOME/.config"

# Prepended path for priority programs
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:$PATH"
# eval "$(mise activate zsh)"
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# Load temporary configs
[ -f "$DOT_HOME/.ztemp" ] && . "$DOT_HOME/.ztemp" # ghcup-env

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  dirhistory
  git
  macos
  rails
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# End of oh-my-zsh configs

# Enviroment variables
export EDITOR='nvim'
export VISUAL='nvim'
export HOMEBREW_NO_AUTO_UPDATE=1
export BAT_THEME="Solarized (dark)"
export FZF_DEFAULT_OPTS='--height 50% --reverse --border -m'

# Commands to run when shell starts
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
source ~/.config/zsh/fzf-git.sh
source ~/.config/zsh/wp.sh
source ~/.config/zsh/rails.sh

# Enables vim keybinds in zsh
bindkey -v

# Aliases
alias gdu='gdu-go'
alias o='open'
alias oo='open .'
alias p='pwd -P'
alias ff='fastfetch'

# Very powerful git aliases
alias lg='lazygit'
alias gsw="_fzf_git_each_ref | xargs git checkout"
alias tiga='tig --all'
alias nm='neomutt'
alias gdst='git diff --stat'
alias gdcst='git diff --cached --stat'

tigf() {
  tig $(git branch -a --list "feature*" | sed 's/^[*] /  /')
}

tigb() {
  tig $(git branch -a --list "backup*" | sed 's/^[*] /  /')
}

# List all visibles within two strokes
alias l='eza -F --sort=type'
alias ll='eza -lh --time-style=iso --no-user --sort=type'
alias la='eza -lha --time-style=long-iso --sort=type'
alias lt='eza -T --sort=type'

# Yummy snake soup
# python3 is managed by apple
alias python='python3'
alias pip='pip3'
alias ipy='ipython'

# Auto activate venv if not activated
deploy() {
  local PROJ_PATH="$HOME/Projects/spacious-rails"
  local PIP_PATH="$PROJ_PATH/.venv/bin/pip3"
  local ACTIVATE_SCRIPT="$PROJ_PATH/.venv/bin/activate"
  cd $PROJ_PATH
  if [ "$(command -v pip3)" != "$PIP_PATH" ]; then
    echo "Activating venv in spacious-rails"
    source "$ACTIVATE_SCRIPT"
  else
    echo "venv is already activated"
  fi
  echo "pip in $(which pip3)"
  echo "Running deployment script"
  ./bin/deploy
}

# Nothing a restart can't fix!
alias rb='unalias -a && source ~/.zshrc'

# Javascript madness
alias npml='npm install --legacy-peer-deps'
alias ys='yarn start'
alias yd='yarn dev'

# Yet to be properly classified
alias todo='nvim ~/vimwiki/index.md'
alias ytdl='yt-dlp --extract-audio --audio-format mp3'

# Useful functions
# fzf settings
fzf-preview() {
  fzf --preview="bat --color=always {}"
}

# Editing configs is easier than ever
ed() {
  case "$1" in
  sh | fish | shell) nvim ~/.config/fish/*.fish ~/.config/fish/custom/*.fish ;;
  nv | nvim) nvim ~/.config/nvim/*.vim ~/.config/nvim/lua/*.lua ~/.config/nvim/lua/plugins/*.lua ;;
  kit | kitty) nvim ~/.config/kitty/kitty.conf ;;
  vm | vifm) nvim ~/.config/vifm/vifmrc ;;
  tm | tmux) nvim ~/.tmux.conf ;;
  h | help)
    echo "ed: Shortcut for editing configs"
    echo "Usage: ed [sh|nv|kit|vm]"
    echo "No argument: Fuzzy search all configs"
    echo "sh: Edit shell config"
    echo "nv: Edit nvim config"
    echo "kit: Edit kitty config"
    echo "vm: Edit vifm config"
    ;;
  *) find ~/dotfiles -type f | fzf-preview -m | xargs nvim ;;
  esac
}

# A useful wrapper for vim with fzf integration
vi() {
  if [[ $# -eq 0 ]]; then
    local files=$(fzf-preview)
    [[ -n "$files" ]] && vim $files
  else
    vim "$@"
  fi
}

# Instantly opens up nvim with oldfiles
alias n="nvim"

# A useful wrapper for nvim with fzf integration
nv() {
  # nv invoked with no arguments
  if [[ $# -eq 0 ]]; then
    fzf-preview | xargs nvim
    # Search from the parent directory
  elif [[ "$1" == "2" ]]; then
    fd -H . ../ | fzf-preview | xargs nvim
    # Search from the grandparent directory
  elif [[ "$1" == "3" ]]; then
    fd -H . ../../ | fzf-preview | xargs nvim
    # otherwise open nvim with the selected files
  else
    nvim "$@"
  fi
}

nvg() {
  nvim $(git ls-files -m)
}

tmux-quantum-switch() {
  # Search through tmux sessions and project directories to connect
  local sessions=$(tmux ls | sed 's/:.*//g')
  local work_dir=$(find ~/projects ~/documents ~/dotfiles -mindepth 1 -maxdepth 2 -type d)
  local selected=$(echo -e "${sessions}\n${work_dir}" | fzf)

  # If none selected, exit function
  if [[ -z $selected ]]; then
    zle reset-prompt
    return 0
  fi

  local selected_name=$(basename "$selected" | tr . _)
  local tmux_running=$(pgrep tmux)

  # If tmux is not running, just create session and leave
  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    return 0
  fi

  # If the session name does not exist, create a new session
  if ! tmux has-session -t=$selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  if [[ -z $TMUX ]]; then
    tmux attach -t $selected_name
  else
    tmux switch-client -t $selected_name
  fi

  zle reset-prompt
}
zle -N tmux-quantum-switch
bindkey '^T' tmux-quantum-switch

quantum-teleport() {
  __zoxide_zi
  zle reset-prompt
}
zle -N quantum-teleport
bindkey '^A' quantum-teleport

git-manipulator() {
  lazygit
}
zle -N git-manipulator
bindkey '^Q' git-manipulator

# A convenient wrapper for tmux
tm() {
  # When ran without arguments, attach to the most recent session or create one if none exists
  if [[ $# -eq 0 ]]; then
    if tmux ls >/dev/null 2>&1; then
      tmux attach
    else
      tmux
    fi
  else
    case "$1" in
    h | help)
      echo "tm: A convenient wrapper for tmux"
      echo "Usage: tm [c|l|k|ka|*]"
      echo "c: Connect to any created session via fuzzy search"
      echo "l: List all tmux sessions"
      echo "k: Kill session by name"
      echo "ka: Kill all sessions"
      echo "*: Spawn or join a new session with name"
      ;;
    c) tmux attach -t $(tmux ls | sed 's/:.*//g' | fzf) ;;
    l | ls) tmux ls ;;
    k | kill) tmux kill-session -t "$2" ;;
    ka | killall) tmux kill-server ;;
    *)
      if tmux has-session -t "$1" >/dev/null 2>&1; then
        tmux attach -t "$1"
      else
        tmux new -s "$1"
      fi
      ;;
    esac
  fi
}

# Function to change directory based on yazi
file-telescope() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
  zle reset-prompt
}
zle -N file-telescope
bindkey '^F' file-telescope

incubate-stupidity() {
  local model=$(ollama list | sed '1d' | awk '{print $1}' | fzf)
  if [[ -n $model ]]; then
    ollama run $model
  fi
}
bindkey -s '^O' 'incubate-stupidity\n'

goto() {
  local keyword=$1
  # list files and do case insensitive search
  nvim $(rg -li "$keyword" | fzf -m --bind=ctrl-a:select-all,ctrl-d:deselect-all)
}

# Function to select music fuzzily
mu() {
  local file="$(find ~/Documents/Music -type f | fzf)"

  # Open only if a file is selected
  if [ -n "$file" ]; then
    # Kill running instances of IINA, the music player
    if pgrep -x "IINA" >/dev/null; then
      killall IINA
    fi
    open "$file"
  fi
}

getip() {
  local publicIP=$(curl -s ifconfig.me)
  local privateIP=$(ifconfig | grep 'inet ' | awk '{print $2}' | tail -n +2)
  echo "Public IP: $publicIP"
  echo "Private IP: $privateIP"
}

getweather() {
  curl -s 'wttr.in?format=%c+T:%t+H:%h+R:%p+W:%w+UV:%u+M:%m\n'
}

# Crop the initial gap of mp3 files
crop() {
  local file=$1
  local start=$2
  local finish=$3
  ffmpeg -i $file -ss $start -to $finish -acodec copy output.mp3
}

timer() {
  local ts=(
    5m
    15m
    30m
    45m
    60m
  )
  local msgs=(
    "You shall rest now"
    "Time to drink water"
    "Take a brief walk"
    "Get up and sleep"
    "It is green time"
  )
  local t=$(printf "%s\n" "${ts[@]}" | fzf)
  local msg=$msgs[$(($RANDOM % $#msgs + 1))]
  # Selectable countdown with random stop messages
  termdown $t && say $msg
}

yt() {
  case "$1" in
  l | list)
    for url in $YT_LIST; do
      echo $url
    done
    ;;
  a | add)
    YT_LIST+=($2)
    export YT_LIST
    ;;
  d | download)
    for url in $YT_LIST; do
      echo "Downloading: $url"
      yt-dlp --extract-audio --audio-format mp3 $url
    done
    export YT_LIST=()
    ;;
  r | remove) export YT_LIST=() ;;
  *) yt l ;;
  esac

}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/opt/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/opt/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

checkin() {
  local time_input=$1
  local line="time_arrive=$time_input"
  sed -i '' "1s/.*/$line/" $HOME/dotfiles/secleft.sh
}
