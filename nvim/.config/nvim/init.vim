" needed, so python provider will work inside a virtualenv
let g:python3_host_prog='/usr/bin/python'

" vundle plugins
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'gmarik/Vundle.vim'

" Integration of file explorers, git, etc
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'		" file explorer
"Plugin 'kien/ctrlp.vim'			" search for a file
Plugin 'rbgrouleff/bclose.vim'			" dependency for ranger, close buffers like in IDE
Plugin 'francoiscabrol/ranger.vim'		" ranger integration in vim
"Plugin 'tpope/vim-fugitive'			" git integration (compare with vimagit)
Plugin 'jreybert/vimagit'			" git integration (https://github.com/jreybert/vimagit#tldr) TEST OUT!!!

" Visual helpers
Plugin 'vim-airline/vim-airline'		" powerline bar
Plugin 'vim-airline/vim-airline-themes'		" powerline themes
Plugin 'powerline/powerline-fonts'		" powerline fonts
Plugin 'ap/vim-css-color'			" visualize colors in css
Plugin 'Yggdroot/indentLine'			" visualize indentation levels

" Code autocompletion, snippets, etc.
Plugin 'vim-syntastic/syntastic'		" syntax checker
Plugin 'davidhalter/jedi-vim'			" auto completion
Plugin 'Valloric/YouCompleteMe'			" auto completion (if it stops working, try changing Plugin to Bundle)
Plugin 'jiangmiao/auto-pairs'			" auto pair paretheses and quotes
Plugin 'SirVer/ultisnips'			" makes adding snippets  to YouCompleteMe possible
Plugin 'honza/vim-snippets'			" snippets for above plugin
"Plugin 'tpope/vim-surround'			" inserting, changing, etc. around  selection - TEST OUT!!!

" Python plugins
Plugin 'vim-scripts/indentpython.vim'		" python indentation
Plugin 'tmhedberg/SimpylFold'			" python code folding

" Syntax plugins
Plugin 'ekalinin/Dockerfile.vim'		" Dockerfile syntax etc.

" Organisation
Plugin 'vimwiki/vimwiki'			" knowledge base, organisation, etc. <leader>ww by default
Plugin 'jkramer/vim-checkbox'			" toggling checkboxes with <leader>tt by default

call vundle#end()
filetype plugin indent on


" PLUGIN CONF
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"let g:syntastic_check_on_open = 1 " generates too much lag on file open
let g:SimpylFold_docstring_preview=1

let g:airline_powerline_fonts = 1
let g:airline_theme='fruit_punch' "murmur/wombat/bubblegum/minimalist/fruit_punch
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:ycm_autoclose_preview_window_after_completion=1
map <A-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:UltiSnipsExpandTrigger="<A-Enter>"
let g:UltiSnipsJumpForwardTrigger="<A-Tab>"
let g:UltiSnipsJumpBackwardTrigger="<A-`>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" VISUAL CONF
set number
set relativenumber
syntax on
colorscheme sublimemonokai
set noshowmode " hide the -- INSERT --, etc

set encoding=utf-8
set clipboard=unnamed

" SPLITS CONF
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" BUFFER 'TABS' CONFIG
noremap <A-w> :Bclose<CR>

noremap <A-j> :bprevious!<CR>
noremap <A-l> :bnext!<CR>

" MIGHT REMAP THIS TO SWITCH TABS:
noremap <A-h> :bprevious!<CR>
noremap <A-k> :bnext!<CR>

" highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
match BadWhitespace /\s\+$/

" SPELLCHECKER
map <F5> :setlocal spell! spelllang=pl<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>

" KEY BINDINGS
"inoremap <A-Tab> <Esc>/<++><Enter>"_c4l " no longer needed when I move my
" snippets to ultisnips. Tutorial here:
" https://www.sirver.net/blog/2011/12/30/first-episode-of-ultisnips-screencast/
nnoremap <space> za

" FILE TYPE CONFIG
autocmd FileType python execute 'source ~/.config/nvim/filetype/python.vim'
autocmd FileType sh execute 'source ~/.config/nvim/filetype/shell.vim'
autocmd FileType html execute 'source ~/.config/nvim/filetype/html.vim'
autocmd FileType css execute 'source ~/.config/nvim/filetype/css.vim'
autocmd FileType javascript,javascriptreact execute 'source ~/.config/nvim/filetype/js.vim'
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" NEEDED IN ORDER TO EDIT FILES THROUGH SCP
autocmd BufRead scp://* :set bt=acwrite

" COPY/CUT TO SYSTEM CLIPBOARD
vnoremap <C-c> "+y
" ADD CUT COMMAND (CURRENTLY <C-x> is bount to decrement)

" IF OPENED FILE IS INSIDE A GIT REPO,
" OPEN A FILE TREE IN ROOT OF THE REPO
let is_git_repo = "git -C " . expand('%:p:h') ." rev-parse --is-inside-work-tree >/dev/null 2>/dev/null && echo -n y"
if system(is_git_repo) == "y"
    autocmd VimEnter * NERDTreeVCS %
    autocmd VimEnter * wincmd p
endif
