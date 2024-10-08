# Alias for vim
alias lv='lvim'
alias nvi='nvim'
alias rn='ranger'

# Alias for modern linux commands
alias b='btop'
alias c='__zoxide_z'
alias ci='__zoxide_zi'
alias gdu='gdu-go'
alias md='mkdir -p'
alias o='open .'
alias p='pwd'
alias pp='pwd -P'
abbr -a ff 'fastfetch'

# fzf settings
alias fzf-preview 'fzf --preview="bat --color=always {}"'

# Alias for git
abbr -a tiga 'tig --all'
alias lg='lazygit'

# Other abbr
abbr -a cl 'clear'

# abbr -a --position anywhere gaa 'git add --all'
# abbr -a --position anywhere gb 'git branch'
# abbr -a --position anywhere gba 'git branch --all | less -F'
# abbr -a --position anywhere gc 'git commit'
# abbr -a --position anywhere gcm 'git commit --message'
# abbr -a --position anywhere gco 'git checkout'
# abbr -a --position anywhere gd 'git diff'
# abbr -a --position anywhere gdca 'git diff --cached'
# abbr -a --position anywhere gdcas 'git diff --cached --stat'
# abbr -a --position anywhere gds 'git diff --stat'
# abbr -a --position anywhere gf 'git fetch'
# abbr -a --position anywhere gl 'git pull'
# abbr -a --position anywhere gm 'git merge'
# abbr -a --position anywhere gp 'git push'
# abbr -a --position anywhere gr 'git reset'
# abbr -a --position anywhere grhh 'git reset --hard'
# abbr -a --position anywhere gs 'git stash'
# abbr -a --position anywhere gst 'git status'

alias Gst='git status'

# Alias for ls
alias l='eza -F --sort=type'
alias ll='eza -lh --time-style=iso --no-user --sort=type'
alias la='eza -lha --time-style=long-iso --sort=type'
alias lt='eza -T --sort=type'

# Alias for programming languages
alias py='python'
alias ipy='ipython'

# Alias for rebooting fish shell
alias rb='source ~/.config/fish/config.fish'

alias tt='ttyper'
