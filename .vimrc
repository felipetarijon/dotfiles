" ~/.vimrc
" Maintainer: Felipe Tarijon de Almeida <felipest9@gmail.com>
" Description: vim initialization file
" Version: 20160831.0
"
" Help? Press K while the cursor is in the keyword

" Local Runtime
if has("win32") || has("win64")
    let $VIMHOME = $HOME."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

" ========
"  COLORS
" ========
colorscheme lyla
syntax enable

" ===============
"  SPACES & TABS
" ===============
set tabstop=4		                        " Number of visual spaces per TAB
set softtabstop=4	                        " Number of spaces while editing
set expandtab 		                        " Tabs are spaces

" ===========
"  UI CONFIG
" ===========
set number		                            " Show line numbers
set showcmd		                            " Show command in bottom bar
set cursorline		                        " Highlight current line
set numberwidth=5
set ruler
set showmatch
set vb t_vb=
set visualbell t_vb=
set colorcolumn=150
highlight ColorColumn ctermbg=white guibg=white

set backupdir=~/vimfiles/backup//
set directory=~/vimfiles/swap//
set undodir=~/vimfiles/undo//

" Size of the window at startup
if has("gui_running")
    set columns=238
        set lines=58
        winpos 2030 66
endif

" Dont let nerdtree cache system32 on windows
if has("win32") || has("win64")
    if expand("%:p:h") =~ 'system32'
        cd $VIMHOME
    endif
endif

" Lets make life easier - copy and paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

set autochdir
set autoread
set backspace=indent,eol,start
set history=50
set hidden " Dont split my windows
set nowrap " Dont wrap long lines
"filetype indent on	                        " Load a specific filetype ident file
filetype indent off
set wildmenu		                        " Visual autocomplete for command menu
set lazyredraw		                        " Redraw only when we need to
set showmatch		                        " Highlight {[()]}

" Toggle Menus and GUI
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=L
    "set guioptions-=r
endif

set encoding=utf-8
set fileencoding=utf-8
set guifont=Lucida_Console:h10

" ===========
"  SEARCHING
" ===========
set incsearch		                        " Search as characters are entered
set hlsearch		                        " Highlight matches
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" =========
"  FOLDING
" =========
set foldenable 		                        " Enable folding
set foldlevelstart=10                       " Open most folds by default
set foldnestmax=10                          " 10 nested fold maximum
nnoremap <space> za	                        " Space open/closes folds

" =========
"  PLUGINS
" =========
execute pathogen#infect()
autocmd VimEnter * NERDTree C:\dev          " Opens the NERDTree
autocmd VimEnter * wincmd p                 " Move the cursor into the main window
autocmd BufWinLeave *.wofl mkview           " Fiz an edge-case with folding single-itens
autocmd BufWinEnter *.wofl silent loadview  " Fix an edge-case with folding single-itens
filetype plugin on
let NERDTreeShowHidden=1                            " Shows hidden files (Files that starts with '.' (dot)
let NERDTreeIgnore = ['\.pyc$', '\.git$', '\.swp$'] " Ignore some hidden files
nmap <leader>n :NERDTreeToggle<CR>

" buffer navigation
nmap <M-Right> :bn<CR>
nmap <M-Left> :bp<CR>
nmap <M-q> :bp<CR>:bd #<CR>
nmap <M-Up> :buffers<CR>

" pretify json
nmap <leader>j :%!python -m json.tool<CR>

" tagbar toggle
nmap <leader>t :TagbarToggle<CR>

" nerdtree toggle
nmap <leader>n :NERDTreeToggle<CR>

" Startup Commands
if has("autocmd")
    " close vim if the only window left open is a NERDTree
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " toggle nerdtree while starting vim
    if has("gui_running")
        au VimEnter * NERDTreeToggle
        au VimEnter * NERDTree C:\dev
        au VimEnter * wincmd l
    endif
endif

nmap <F8> :TagbarToggle<CR>                 " F8 to Toggle TagBar

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-airline
let g:airline_theme='base16_isotope'
let g:airline#extensions#tabline#enabled = 1

" CtrlP - Fuzzy Finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Gitgutter
nmap <leader>g :GitGutter
