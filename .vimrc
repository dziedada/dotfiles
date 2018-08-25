set nocompatible

" Load vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins
call plug#begin('~/.vim/plugged')
  Plug 'vim-scripts/DoxygenToolkit.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/syntastic'
  Plug 'powerline/powerline'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'godlygeek/tabular'
  Plug 'tomasr/molokai'
  Plug 'tpope/vim-fugitive'
  Plug 'Valloric/YouCompleteMe'
  Plug 'derekwyatt/vim-fswitch'
  Plug 'tpope/vim-surround'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'xuhdev/vim-latex-live-preview'
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
call plug#end()

" Set backup directrory for swapfiles
if empty(glob('~/.vim/swapfiles'))
  silent !mkdir ~/.vim/swapfiles
endif
set directory=$HOME/.vim/swapfiles//

" Set colorcolumn to 81 chars
if exists('+colorcolumn')
  set colorcolumn=81
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Wrap lines at 80 chars
set wrap
set textwidth=80
autocmd BufNewFile,BufRead * setlocal fo+=t
set linebreak

" Turn on syntax highlighting
set t_Co=256
syntax on

" Set UTF-8 Encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Use indentation of previous line
set autoindent

" Use intelligent indentation for C langs
set smartindent

" Jump to last position when opening files
if has('autocmd')
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal! g'\"" | endif
endif

" Switch tabs with arrow keys
nnoremap <Right> gt
nnoremap <Left> gT

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Go to end and beginning of line
nnoremap ff 0
nnoremap <S-f> $

" Unmap annoying brace mappings
map { <Nop>
map } <Nop>
map ( <Nop>
map ) <Nop>

" Highlight matching braces
set showmatch

" Highlight while searching
set incsearch

" Intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Set indent markings
" The space at the end is made using <C-v>u2002
set list lcs=tab:\| 

" Show line and column of cursor
set cursorline
set cursorcolumn

" Use relative line numbers
set relativenumber
set number

" Use system clipboard for copy/paste
set clipboard=unnamedplus
vnoremap <C-c> "*y
vnoremap <C-p> "*p

" Start scrolling up or down after 15 lines from top/bottom
set scrolloff=15

" Make backspace work again
set backspace=indent,eol,start

" Save file with <F2>
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

" Read file in hex
command Hexread execute ":%!xxd"

" Resize panes when host window is resized
autocmd VimResized * wincmd =


" Allow scrolling vim in xterm
set mouse=a

" Merge conflic resolution
function DiffgetLocal()
  set diffopt=filler,context:1000000
  diffget LO
endfunction

function DiffgetRemote()
  set diffopt=filler,context:1000000
  diffget RE
endfunction

function ExitMergeResolution()
  if search("<<<<<<<") || search(">>>>>>>")
    echoerr "You ain't done yet, sit your ass back down!"
  else
    wq | qa
  endif
endfunction

nnoremap dl :call DiffgetLocal()<CR>
nnoremap dr :call DiffgetRemote()<CR>
nnoremap dn /<<<<<CR><C-d>N
nnoremap dq :call ExitMergeResolution()<CR>

"                              Plugin settings:
"==============================================================================

"                                  FSwitch
"------------------------------------------------------------------------------
" Map <F4> to switch between source and header file
map <F4> :FSHere<CR>

"                                Conque GDB
"------------------------------------------------------------------------------
let g:ConqueGdb_SrcSplit = 'right' " Source code on right
let g:ConqueTerm_PyVersion = 3     " Python version 3

"                               YouCompleteMe
"------------------------------------------------------------------------------
let g:ycm_show_diagnostics_ui = 0 " Necessary for syntastic to check on write
" Generate YCM config in current directory
nmap <C-F11> :YcmGenerateConfig

"                               Molokai Theme
"------------------------------------------------------------------------------
colorscheme molokai
let g:rehash256=1
let g:molokai_original=1
hi Normal guibg=NONE ctermbg=NONE

"                                Auto Pairs
"------------------------------------------------------------------------------
let g:AutoPairsFlyMode = 0 " This is very annoying if enabled

" Proper curly brace placement
inoremap {<CR> {<CR><BS>}<ESC>O

"                                 NERDTree
"------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1 " Exit NERDTree after opening file

" Tab management
nnoremap = :tabnew<CR>:NERDTreeToggle<CR>
nnoremap - :tabclose<CR>

"                                 Airline
"------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="molokai"
set laststatus=2

"                               Syntastic
"------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Global options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "active_filetypes": ['c++', 'c'],
  \ "passive_filetypes": ['txt']}

" C++ options
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ["clang_check", "gcc", "cppcheck"]
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-Wall -Wextra -Werror -pthread "
let g:syntastic_cpp_compiler_options += "-std=c++17 -g -fPIC fsanitize=address "
let g:syntastic_cpp_clang_check_args = "-Wall -Wextra -Werror -pthread "
let g:syntastic_cpp_clang_check_args += "-std=c++17 -g -fPIC fsanitize=address "

" YAML options
let g:syntastic_yaml_checkers = ['yamllint']

" Jump between syntastic errors
nnoremap al :lnext<CR>
nnoremap ap :lprev<CR>

"                               Easytags
"------------------------------------------------------------------------------
" Load tag files
set tags+=~/.vim/tags/cpp

" Update ctags for current folder using Ctrl + F12
map <C-F12> :UpdateTags<CR>
map <F12> :HighlightTags<CR>

"                            Doxygen Toolkit
"------------------------------------------------------------------------------
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_startCommentBlock = "/*"
let g:DoxygenToolkit_interCommentTag = "* "
let g:DoxygenToolkit_authorName="Romario Pashollari (rpash@umich.edu)"

" Create Doxygen comment
map <F6> :Dox<CR>

"                                 Tagbar
"------------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
