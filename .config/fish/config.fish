# Files to source, e.g. alias
source /Users/chanjason/.config/fish/alias.fish
source /Users/chanjason/.config/fish/temp.fish

# Path to rust programs
export PATH="$HOME/.cargo/bin:/Users/chanjason/.local/bin:$HOME/.ghcup/bin:$PATH"

# Text editors
export EDITOR='nvim'
export VISUAL='nvim'
export SHELL='/usr/local/bin/fish'

# Bat theme
export BAT_THEME="Solarized (dark)"

# Enables vim keybinds in fish
fish_vi_key_bindings

# fzf settings
export FZF_DEFAULT_OPTS='--height 50% --reverse --border -m'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
