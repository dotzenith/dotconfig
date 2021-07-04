"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Enable Backspace
:set backspace=indent,eol,start

"Quality of life 

syntax on
set clipboard=unnamedplus
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set incsearch

"vim-plug 
call plug#begin('~/.vim/plugged')

Plug 'dhruvasagar/vim-table-mode'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()


