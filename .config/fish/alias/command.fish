# Alias for vim
alias lv='lvim'
alias nvi='nvim'
alias vm='vifm .'

# Alias for modern linux commands
alias b='btop'
alias c='__zoxide_z'
alias ci='__zoxide_zi'
alias gdu='gdu-go'
alias o='open .'
alias p='pwd'
alias pp='pwd -P'

# fzf settings
alias fzf-preview 'fzf --preview="bat --color=always {}"'

# Alias for git
abbr -a tiga 'tig --all'
alias lg='lazygit'

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

# Alias for rebooting fish shell
alias rb='source ~/.config/fish/config.fish'

alias tt='ttyper'
