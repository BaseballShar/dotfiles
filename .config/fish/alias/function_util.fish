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

# cd to viewing directory when quitting vifm
function vm
    set dst "$(command vifm . --choose-dir - $argv[2..-1])"
    if [ -z "$dst" ];
        echo 'Directory picking cancelled/failed'
        return 1
    end
    cd "$dst"
end
