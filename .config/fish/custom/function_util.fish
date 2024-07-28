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
  mkdir -p ~/Downloads/music
  cd music
  # If no argument, download the default playlist
  if test (count $argv) -eq 0
    yt-dlp --extract-audio --audio-format mp3 'https://www.youtube.com/playlist?list=PLN0FTc65cafjUNGRyfsfdBaMW8P0W6qh7'
    # Otherwise, download the selected song
  else
    yt-dlp --extract-audio --audio-format mp3 $argv[1]
  end
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

function fm
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
