# my scripts
PATH=$PATH:$HOME/bin
# snap
PATH=$PATH:/snap/bin
# pip
PATH=$PATH:$HOME/.local/bin
# do późniejszego wywalenia
alias conda=/opt/miniconda3/bin/conda

# editor
VISUAL=/usr/bin/nvim; export VISUAL
EDITOR=/usr/bin/nvim; export EDITOR
alias vim="nvim"

alias getvol="pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'"
alias get_scr_res="xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'"

# option aliases
alias ll="ls -alh"
alias cpclip="xclip -selection clipboard"
alias fzf="fzf --height 40% --layout reverse --info inline --border --preview 'file -b {}' --preview-window down:1:noborder"

# functions
vman() { man $@ >/dev/null && nvim <(man $@) }
vf() { fzf | xargs -r -I % $EDITOR % ; }
mkcd () {
    mkdir -p $1 &&
    cd -P $1 # -P to follow symlinks
}

use-amd () { env DRI_PRIME=1 $@ }
# overwrite steam definition to use the discrete graphics card
steam () { use-amd /usr/bin/steam }
vlc(){ /usr/bin/vlc "$@" >/dev/null 2>/dev/null & }

# exports
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#f0f0f0,hl:#66d9ef --color=fg+:#ffffff,hl+:#78dce8 --color=info:#e6db74,prompt:#f92672,pointer:#ae81ff --color=marker:#a6e22e,spinner:#ae81ff,header:#87afaf'
# use ripgrep for fzf file search
# export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
