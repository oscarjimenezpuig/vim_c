" NVIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier & Oscar Jimenez
"

" Vundle
set rtp+=/home/oscar/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
 " *Definition of plugins
 Plugin 'nanotech/jellybeans.vim'			"colo jellybeans
 Plugin 'sheerun/vim-wombat-scheme'			"colo wombat
 Plugin 'itchyny/lightline.vim' 			"lightline
 Plugin 'scrooloose/nerdtree' 				"nerdtree
 " *End definition of plugins"
call vundle#end()
filetype plugin indent on

" Introduccion de cabecera automatica
autocmd bufnewfile *.h so /home/oscar/.config/nvim/c_header.txt
autocmd bufnewfile *.h exe "1," . 5 . "g/Fichero:.*/s//Fichero: " .expand("%")
autocmd bufnewfile *.h exe "1," . 5 . "g/Creado:.*/s//Creado: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.h execute "normal ma"
autocmd Bufwritepre,filewritepre *.h exe "1," . 5 . "g/Ultima Modificacion:.*/s/Ultima Modificacion:.*/Ultima Modificacion: " .strftime("%c")
autocmd bufwritepost,filewritepost *.h execute "normal `a"
autocmd bufnewfile *.cpp so /home/oscar/.config/nvim/c_header.txt
autocmd bufnewfile *.cpp exe "1," . 5 . "g/Fichero:.*/s//Fichero: " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 5 . "g/Creado:.*/s//Creado: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "1," . 5 . "g/Ultima Modificacion:.*/s/Ultima Modificacion:.*/Ultima Modificacion: " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a"
autocmd bufnewfile *.c so /home/oscar/.config/nvim/c_header.txt
autocmd bufnewfile *.c exe "1," . 5 . "g/Fichero:.*/s//Fichero: " .expand("%")
autocmd bufnewfile *.c exe "1," . 5 . "g/Creado:.*/s//Creado: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 5 . "g/Ultima Modificacion:.*/s/Ultima Modificacion:.*/Ultima Modificacion: " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"


" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" disable autocorreccion
set nospell

"disable filetype
filetype off

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
"set expandtab        " expand tabs to spaces

" no wrap lines
set nowrap

" turn syntax highlighting on
set t_Co=256
syntax on

" background
set background=dark

" colorscheme
colorscheme jellybeans 

" turn line numbers on
set number

" turn actual line on
set cursorline

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" enable mouse usage (all modes)
set mouse=a

" enable highligt in search
set hlsearch

" disable bells
set noerrorbells

" lightline configuration
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ }

" open nerdtree
autocmd vimenter * NERDTree

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enhanced keyboard mappings

" *in normal mode F2 will save the file
nmap <F2> :w<CR>
" *in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" *switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" *recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" *build using makeprg with <F7>
map <F7> :make<CR>
" *build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" *goto definition with F12
map <F12> <C-]>
