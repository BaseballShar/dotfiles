# <--- Alias --->
alias zal='lvim /Users/chanjason/.config/zsh/alias.sh'
alias temp='lvim /Users/chanjason/.config/zsh/temp.sh'

# Quick access to common directory
alias doc='cd /Users/chanjason/Documents/Something'

# Alias for modern linux commands
alias b='btop'
alias c='__zoxide_z'
alias ci='__zoxide_zi'

alias d='diff'
alias vd='nvim -d'

alias p='pwd'
alias pp='pwd -P'

alias o='open .'

# Search for web in terminal
alias g='ddgr'

alias gdu='gdu-go'

alias rip='rip --graveyard ~/.local/share/Trash'

alias y='youtube-dl'

# Alias for editing this config
alias zed='lvim ~/.zshrc'
alias ved='lvim ~/.vimrc'

# Alias for git
alias tiga='tig --all'
alias gba='git branch --all | less -F'
alias gpo='git push origin'
alias gpom='git push origin main'
alias gce='git config --global --edit'

# Alias for ls
alias l='exa -F --sort=type'
alias ll='exa -lh --time-style=iso --no-user --sort=type'
alias la='exa -lha --time-style=long-iso --sort=type'
alias lt='exa -T'

# Alias for programming languages
alias py='python3'
alias nv='lvim'
alias vm='vifm .'

# Alias for searching files
alias fcd='find . -type d 2>/dev/null | ag'
alias fcf='find . -type f 2>/dev/null | ag'
alias fca="find . 2>/dev/null | ag"

# Alias for rebooting zsh shell
alias rb='source ~/.zshrc'

# Alias for copying public key to clipboard
alias pkcp='cat ~/.ssh/id_rsa.pub | pbcopy'

# Alias for connecting to dev7
alias s7='ssh connect-dev7'

# Synchornise portals
alias portalsync='portalup; portaldown'

alias vomit='grep -r a /; grep -r b /; grep -r c /; grep -r d /; grep -r e /'

alias tt='ttyper'

eval $(thefuck --alias)

# A usefuk function for listing disk usage
function ldu() {
	if [[ "$1" == "-h" ]]; then
		echo -e "NAME:
    ldu - List Disk Usage

    USAGE:
    ldu [-ahr]

    DESCRIPTION:
    Calculate the total size of every directory/file in the current directory. Default behaviour is to display in ascending order of file size.

    FLAGS:
    -a	Sorts in alphabetic order
    -h	Prints help information
    -r	Sorts in reverse numeric order"
	elif [[ "$1" == "-a" ]]; then
		du -sh * 2>/dev/null
	elif [[ "$1" == "-r" ]]; then
		du -sh * 2>/dev/null | sort -rh
	else
		du -sh * 2>/dev/null | sort -h
	fi
}

# Faster connection to dev machines
function sshd() {
	local id=$1
	echo "Established ssh connection to dev $1 machine"
	ssh "connect-dev$1"
}

# Function for establishing scp with less verbosity
function portal() {
	local src=$1
	local des=$2
	scp -r "/Users/chanjason/Desktop/$src" "connect-dev7:/fw/src/$des"
}

# A cool way to teleport files from local machine to dev machine
function portalup() {
	scp -r '/Users/chanjason/Desktop/PORTAL' 'connect-dev7:/fw/src'
}

# An equally cool way to teleport files from dev machine to local machine
function portaldown() {
	scp -r 'connect-dev7:/fw/src/PORTAL' '/Users/chanjason/Desktop'
}

# Clears your portal, you know to be clean
function portalclean() {
	cd /Users/chanjason/Desktop/PORTAL
	rm -rf $(ls /Users/chanjason/Desktop/PORTAL | ag -v Icon)
}

# Backup your documents and desktop files
function backup() {
	local maxBackup=3

	# Check if the drive is connected, suspend if not
	if test -d '/Volumes/Mac Files'; then
		echo 'Starting to backup'
	else
		echo 'Drive not found, aborting backup'
		return
	fi

	# Create a backup folder with the current date
	# Copy the Desktop and Documents folder to the backup folder
	local filename=$(date '+[%d-%m-%y-%H%M]')' Backup'
	local dirpath='/Volumes/Mac Files/Backup/'
	mkdir $dirpath$filename
	cp -r /Users/chanjason/Desktop $dirpath$filename
	cp -r /Users/chanjason/Documents/Something $dirpath$filename

	# Delete the oldest backup if total number of backups exceeds $maxBackup
	numDir=$(ls $dirpath | wc -l)
	if [[ $numDir -gt $maxBackup ]]; then
		echo 'There are more than' $maxBackup 'backups'
		oldestDir=$(exa $dirpath --sort=created | head -n 1)
		echo 'Deleting' $oldestDir
		rm -rf $dirpath$oldestDir
	fi

	echo 'Backup finished'
}

# Backup zsh and vim configs
# cp file ~/backup (file)
# cp -r dir ~/backup (folder)
function cfgbackup() {
    cp ~/.zshrc ~/Backup
    cp ~/.vimrc ~/Backup
    cp -r ~/.vim ~/Backup
    cp -r ~/.config/zsh ~/Backup
    cp -r ~/.config/vifm ~/Backup
    cp -r ~/.config/nvim ~/Backup
    cp -r ~/.config/lvim ~/Backup
}

# Recover config from backup
# cp ~/Backup/file originalPath
# cp -r ~/Backup/dir originalPath
function cfgrecover() {
    cp ~/Backup/.zshrc ~
    cp ~/Backup/.vimrc ~
    cp -r ~/Backup/.vim ~
    cp -r ~/Backup/zsh ~/.config
    cp -r ~/Backup/vifm ~/.config
    cp -r ~/Backup/nvim ~/.config
    cp -r ~/Backup/lvim ~/.config
}
