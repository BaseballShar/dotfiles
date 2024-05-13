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
    nvim ~/.config/fish/*.fish ~/.config/fish/alias/*.fish
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