# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to rust programs
export PATH="$HOME/.cargo/bin:~/.local/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
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
plugins=(git zsh-autosuggestions web-search dirhistory macos colored-man-pages zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Commands to run when shell starts
# ssh-add ~/.ssh/id_rsa
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
source ~/.config/zsh/fzf-git.sh

# Enables vim keybinds in zsh
bindkey -v

# Enviroment variables
export HOMEBREW_NO_AUTO_UPDATE=1

# Bat theme
export BAT_THEME="Solarized (dark)"

# Enables vim keybinds in zsh
bindkey -v

# fzf settings
export FZF_DEFAULT_OPTS='--height 50% --reverse --border -m'

# Alias and functions
# Alias for modern linux commands
alias b='btop'
alias c='__zoxide_z'
alias ci='__zoxide_zi'
alias gdu='gdu-go'
alias md='mkdir -p'
alias o='open .'
alias p='pwd'
alias pp='pwd -P'
alias ff='fastfetch'

# Alias for git
alias lg='lazygit'

# Alias for ls
alias l='eza -F --sort=type'
alias ll='eza -lh --time-style=iso --no-user --sort=type'
alias la='eza -lha --time-style=long-iso --sort=type'
alias lt='eza -T --sort=type'

# Alias for programming languages
alias py='python'
alias py3='python3'
alias ipy='ipython'
alias ipy3='ipython3'

# Alias for rebooting zsh shell
alias rb='source ~/.zshrc'

# Alias for other programs
alias tt='ttyper'
alias tiga='tig --all'
alias todo='nvim ~/vimwiki/index.md'

# Useful functions
# fzf settings
function fzf-preview {
  fzf --preview="bat --color=always {}"
}

# Editing configs is easier than ever
function ed {
  case "$1" in
    sh|fish|shell) nvim ~/.config/fish/*.fish ~/.config/fish/custom/*.fish ;;
    nv|nvim) nvim ~/.config/nvim/*.vim ~/.config/nvim/lua/*.lua ~/.config/nvim/lua/plugins/*.lua ;;
    kit|kitty) nvim ~/.config/kitty/kitty.conf ;;
    vm|vifm) nvim ~/.config/vifm/vifmrc ;;
    tm|tmux) nvim ~/.tmux.conf ;;
    h|help)
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
function vi {
  if [[ $# -eq 0 ]]; then
    local files=$(fzf-preview)
    [[ -n "$files" ]] && vim $files
  else
    vim "$@"
  fi
}

# A useful wrapper for nvim with fzf integration
function nv {
  if [[ $# -eq 0 ]]; then
    local files=$(fzf-preview)
    [[ -n "$files" ]] && nvim $files
  else
    nvim "$@"
  fi
}

# A convenient wrapper for tmux
function tm {
  if [[ $# -eq 0 ]]; then
    if tmux ls >/dev/null 2>&1; then
      tmux attach
    else
      tmux
    fi
  else
    case "$1" in
      h|help)
        echo "tm: A convenient wrapper for tmux"
        echo "Usage: tm [l|k|ka|*]"
        echo "l: List all tmux sessions"
        echo "k: Kill session by name"
        echo "ka: Kill all sessions"
        echo "*: Spawn or join a new session with name"
        ;;
      l|ls) tmux ls ;;
      k|kill) tmux kill-session -t "$2" ;;
      ka|killall) tmux kill-server ;;
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
function fm {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
