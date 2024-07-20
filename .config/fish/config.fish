# User defined alias
source /Users/chanjason/.config/fish/temp.fish
source /Users/chanjason/.config/fish/alias/path.fish
source /Users/chanjason/.config/fish/alias/command.fish

# User defined abbreviations
source /Users/chanjason/.config/fish/alias/abbr.fish

# User defined functions
source /Users/chanjason/.config/fish/alias/function_fzf.fish
source /Users/chanjason/.config/fish/alias/function_util.fish

# Path to rust programs
export PATH="$HOME/.cargo/bin:/Users/chanjason/.local/bin:$HOME/.ghcup/bin:$PATH"

# Text editors
export EDITOR='vim'
export VISUAL='vim'
export SHELL='/usr/local/bin/fish'

# Env variables
set -gx HOMEBREW_NO_AUTO_UPDATE 1

# Bat theme
export BAT_THEME="Solarized (dark)"

# Enables vim keybinds in fish
fish_vi_key_bindings

# fzf settings
export FZF_DEFAULT_OPTS='--height 50% --reverse --border -m'

function fish_greeting
  echo "Welcome back, Fisher Baseball!"
  fastfetch
end

# Do not print vim mode on prompt
function fish_vi_mode_prompt
end

# Initialisation
zoxide init fish | source
starship init fish | source

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
