# my scripts
PATH=$PATH:$HOME/bin
# snap
PATH=$PATH:/snap/bin
# pip
PATH=$PATH:$HOME/.local/bin

# editor
VISUAL=/usr/bin/nvim; export VISUAL
EDITOR=/usr/bin/nvim; export EDITOR
alias vim="nvim"

# my aliases
alias cdow="cd ~/Downloads"
alias cdcode="cd ~/code"
alias cdbin="cd ~/bin"
alias cddesk="cd ~/Desktop"

# make a my_conf script, that shows a menu for selecting a conf file
# should be easier after I make a config git repo using stow
# find PATH_TO_REPO -type f | fzf

alias ll="ls -alh"
alias getvol="pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'"

alias gitlog="git log --graph --pretty=format:\"%Cred%an - %ar %Creset%d %n %Cblue %h -%Cgreen %s %n %b %n\""

# functions
mkcd () {
    mkdir -p $1 &&
    cd -P $1 # -P to follow symlinks
}
use-amd () {
	env DRI_PRIME=1 $@
}
# overwrite steam definition to use the discrete graphics card
steam () {
	use-amd /usr/bin/steam
}
cpclip () {
	xclip -selection clipboard
}

get_scr_res() {
    xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'
}

# set and generate a color scheme from wallpaper
wal_file=~/Pictures/wp
setwallpaper () {
    pic=$1
    shift
    wal -c
    # [ -d ~/.cache/wal/schemes ] && rm -f ~/cache/wal/schemes/*
    [ -e ~/Pictures/wp ] && rm -f $wal_file
    xwallpaper --zoom $pic
    ln $pic $wal_file
    wal $@ -ni $wal_file
}

# pywal terminal colors
# (cat ~/.cache/wal/sequences &)
