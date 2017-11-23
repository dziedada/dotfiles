set nocompatible              " be iMproved,  required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" alternatively,  pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here'

" let Vundle manage Vundle,  required
Plugin 'VundleVim/Vundle.vim'
Plugin 'DoxygenToolkit.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'powerline/powerline'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
" set colorcolumn at 101 chars
if exists('+colorcolumn')
  set colorcolumn=101
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" enable plugins
filetype plugin on
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" Jump to last position when opening files
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	  \| exe "normal! g'\"" | endif
endif

" FSwitch <F4> to switch source/header
map <F4> :FSHere<CR>

" vim-latex
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Conque GDB
let g:ConqueGdb_SrcSplit = 'right'
let g:ConqueTerm_PyVersion = 3


" YCM
let g:ycm_show_diagnostics_ui = 0 "necessary to allow syntasic to check on write

" molokai
colorscheme molokai
let g:rehash256=1
let g:molokai_original=1
hi Normal guibg=NONE ctermbg=NONE

" auto-pairs
let g:AutoPairsFlyMode = 0

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
set laststatus=2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ["clang_check", "gcc", "cppcheck"]
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = "-Wall -Wextra -Werror -pthread -std=c++14 -g -fPIC"
let g:syntastic_cpp_clang_check_args = "-Wall -Wextra -Werror -pthread -std=c++14 -g -fPIC"
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_debug=0
let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "active_filetypes": ["c++", "c"],
	\ "passive_filetypes": ["txt"]}

" Jump between syntasic errors
nnoremap al :lnext<CR>
nnoremap ap :lprev<CR>

" Curly brace placement
inoremap {<CR> {<CR><BS>}<Esc>O
" move tabs
nnoremap <Right> gt
nnoremap <Left> gT
nnoremap = :tabnew<CR>:NERDTreeToggle<CR>
nnoremap - :tabclose<CR>
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" go to end and beggining of line
nnoremap ff 0
nnoremap <S-f> $

" unmap annoying { and  } mapping
map { <Nop>
map } <Nop>
map ( <Nop>
map ) <Nop>

" wrap lines at 100 chars
set wrap
set textwidth=100
autocmd BufNewFile,BufRead * setlocal fo+=t
set linebreak
" turn syntax highlighting on
set t_Co=256
syntax on
" set colorscheme
"colorscheme herald
"highlight Pmenu ctermfg=123 ctermbg=90
"highlight PmenuSel ctermfg=194 ctermbg=61
"highlight SpellBad ctermfg=193 ctermbg=1
"highlight Visual ctermfg=0 ctermbg=122
"highlight SpellCap ctermfg=193 ctermbg=166
"highlight MatchParen cterm=bold ctermfg=51 ctermbg=238
" Indent markings NOTE: There is a blank character at the end of this line
" Use <C-v>u2002 to set the character
set list lcs=tab:\| 
" Show line and color of cursor

" wrap lines at 100 chars
set wrap
set textwidth=100
autocmd BufNewFile,BufRead * setlocal fo+=t
set linebreak
" turn syntax highlighting on
set t_Co=256
syntax on
" set colorscheme
"colorscheme herald
"highlight Pmenu ctermfg=123 ctermbg=90
"highlight PmenuSel ctermfg=194 ctermbg=61
"highlight SpellBad ctermfg=193 ctermbg=1
"highlight Visual ctermfg=0 ctermbg=122
"highlight SpellCap ctermfg=193 ctermbg=166
"highlight MatchParen cterm=bold ctermfg=51 ctermbg=238
" Indent markings NOTE: There is a blank character at the end of this line
" Use <C-v>u2002 to set the character
set list lcs=tab:\| 
" Show line and color of cursor
set cursorcolumn
set cursorline
" turn line numbers on
set relativenumber
set number
" set backup directory elsewhere
set directory=$HOME/.vim/swapfiles//
" use system clipboard for yanking out of vim
set clipboard=unnamedplus
vnoremap <C-c> "*y
nnoremap <S-p> "*p
" highlight matching braces
set showmatch
" highlight while searching
set incsearch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Load standard tag files
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
"set tags+=./tags;/
"OmniCppCompletion
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_ShowAccess = 1
"let OmniCpp_DisplayMode = 1
"let OmniCpp_DefaultNamespaces = ["std"]
"let OmniCpp_LocalSearchDec1 = 1

" Functions for merge conflict resolution
function DiffgetLo()
    " filler is default and inserts empty lines for sync
    set diffopt=filler,context:1000000
    diffget LO
endfunction
function DiffgetRe()
    " filler is default and inserts empty lines for sync
    set diffopt=filler,context:1000000
    diffget RE
endfunction
function ExitMergeResolutionIfDone()
    if search("<<<<<<<") || search(">>>>>>>")
        echoerr "Still conflicts to resolve!"
    else
        wq | qa
    endif
endfunction
nnoremap dl :call DiffgetLo()<CR>
nnoremap dr :call DiffgetRe()<CR>
nnoremap dn /<<<<<CR><C-d>N
nnoremap dq :call ExitMergeResolutionIfDone()<CR>

" Smart VS-type <tab-completion>
" function! CompleteTab(direction)
"   let prec = strpart( getline('.'), 0, col('.')-1 )
"   if prec =~ '^\s*$'
"      if "backward" == a:direction
"         return "\<bs>"
"      else
"         return "\<tab>"
"      endif
"    endif
"    if exists('&omnifunc') && &omnifunc == 'omni#cpp#complete#Main' && prec =~
"               '[\.>]\s*[~]\?[a-zA-Z_]*[(]\?$'
"      " Class completion... use normal direction
"      " Use this with omniCompletion
"      if "backward" == a:direction
"          return "\<c-p>"
"      else
"          return "\<c-n>"
"      endif
"    endif
"    " else use generic completion: last-seen / reverse-order
"    if "backward" == a:direction
"       return "\<c-n>"
"    else
"       return "\<c-p>"
"    endif
"endfunction

"inoremap <tab><c-r>=CompleteTab("forward")<cr>
"inoremap <s-tab><c-r>=CompleteTab("backward")<cr>

"Doxygen Toolkit Settings
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_startCommentBlock = "/*"
let g:DoxygenToolkit_interCommentTag = "* "
let g:DoxygenToolkit_authorName="Romario Pashollari (rpash@umich.edu)"

" Start scrolling up or down after 15 lines from bottom
set scrolloff=15
" Remove trailing white space
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" map <ctrl>+F12 to generate ctags for current folder:
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <C-F12> :UpdateTags<CR>
map <F12> :HighlightTags<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" Open Tagbar
nmap <F8> :TagbarToggle<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

" Read file in hex
command Hexread execute ":%!xxd"

set exrc
set secure
