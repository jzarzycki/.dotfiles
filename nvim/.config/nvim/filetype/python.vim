" whitespace
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" python with virtualenv
let g:ycm_python_binary_path = 'python'
let g:ycm_python_interpreter_path = 'python'

" autocmd BufRead,BufNewFile *.py
let python_highlight_all=1

" special key bindings
nnoremap <F8> :!pylint %<CR>
nnoremap <F9> :%!autopep8 %<CR>

" snippets
inoremap main<Tab> def main(<++>):<Enter><++><Enter><Enter><Esc>oif __name__ == "__main__":<Enter>main(<++>)<Esc>5k0i
