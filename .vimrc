" ~/.vimrc
" Maintainer: Felipe Tarijon de Almeida <felipest9@gmail.com>
" Description: vim initialization file
" Version: 20161005.0
"
" Help? Press K while the cursor is in the keyword
"
"   _____      .__  .__                  __               .__     __               
" _/ ____\____ |  | |__|_____   ____   _/  |______ _______|__|   |__| ____   ____  
" \   __\/ __ \|  | |  \____ \_/ __ \  \   __\__  \\_  __ \  |   |  |/  _ \ /    \ 
"  |  | \  ___/|  |_|  |  |_> >  ___/   |  |  / __ \|  | \/  |   |  (  <_> )   |  \
"  |__|  \___  >____/__|   __/ \___  >  |__| (____  /__|  |__/\__|  |\____/|___|  /
"            \/        |__|        \/             \/         \______|           \/
" ____
"                    _.' :  `._
"                .-.'`.  ;   .'`.-.
"       __      / : ___\ ;  /___ ; \      __  
"     ,'_ ''--.:__;".-.";: :".-.":__;.--"" _`,
"     :' `.t""--.. '<@.`;_  ',@>` ..--""j.' `;
"          `:-.._J '-.-'L__ `-- ' L_..-;'     
"            '-.__ ;  .-"  '-.  : __.-"       
"                L ' /.------.\ ' J           
"                 '-.   '--"   .-"            
"                __.l"-:_JL_;-";.__
"             .-j/'.;  ;""""  / .'\"-.        
"           .' /:`. '-.:     .-" .';  `.      
"        .-"  / ;  '-. '-..-" .-"  :    "-.   
"     .+"-.  : :      '-.__.-"      ;-._   \  
"     ; \  `.; ;                    : : "+. ; 
"     :  ;   ; ;                    : ;  : \: 
"     ;  :   ; :                    ;:   ;  :
"    : \  ;  :  ;                  : ;  /  :: 
"    ;  ; :   ; :                  ;   :   ;: 
"    :  :  ;  :  ;                : :  ;  : ; 
"    ;\    :   ; :                ; ;     ; ; 
"    : `."-;   :  ;              :  ;    /  ; 
"     ;    -:   ; :              ;  : .-"   : 
"     :\     \  :  ;            : \.-"      : 
"      ;`.    \  ; :            ;.'_..--  / ;
"      :  '-.  '-:  ;          :/."      .'  :
"       \         \ :          ;/  __        :
"        \       .-`.\        /t-""  ":-+.   :
"         `.  .-"    `l    __/ /`. :  ; ; \  ;
"           \   .-" .-"-.-"  .' .'j \  /   ;/
"            \ / .-"   /.     .'.' ;_:'    ;
"             :-""-.`./-.'     /    `.___.'
"                   \ `t  ._  /
"                    "-.t-._:'

let $WORKING_DIR = "~/dev"

" Local Runtime
if has("win32") || has("win64")
    let $VIMHOME = $HOME."/vimfiles"
    let $VIMFILE = "_vimrc"
else
    let $VIMHOME = $HOME."/.vim"
    let $VIMFILE = ".vimrc"
endif

" ===============
"  SPACES & TABS
" ===============
set tabstop=4		                        " Number of visual spaces per TAB
set softtabstop=4	                        " Number of spaces while editing
set expandtab 		                        " Tabs are spaces

" ===========
"  UI CONFIG
" ===========
syntax enable
set number		                            " Show line numbers
set showcmd		                            " Show command in bottom bar
set cursorline		                        " Highlight current line
set ruler
set showmatch
autocmd GUIEnter * set vb t_vb=
autocmd VimEnter * set vb t_vb=
set colorcolumn=150
highlight ColorColumn ctermbg=white guibg=white
hi ColorColumn guibg=white ctermbg=white

set backupdir=$VIMHOME/backup//
set directory=$VIMHOME/swap//
set undodir=$VIMHOME/undo//

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

nnoremap <C-S-Up> ddkP
nnoremap <C-S-Down> ddp
nnoremap <C-S-d> YP

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

" ===========
"  SEARCHING
" ===========
set incsearch		                        " Search as characters are entered
set hlsearch		                        " Highlight matches
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" =========
"  PLUGINS
" =========
set rtp+=$VIMHOME/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vitalk/vim-simple-todo'
Plugin 'joshdick/onedark.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'davidhalter/jedi-vim'
Plugin 'joonty/vdebug'
call vundle#end()
filetype plugin indent on
colorscheme onedark

autocmd VimEnter * NERDTree $WORKING_DIR    " Opens the NERDTree
autocmd VimEnter * wincmd p                 " Move the cursor into the main window
autocmd BufWinLeave *.wofl mkview           " Fiz an edge-case with folding single-itens
autocmd BufWinEnter *.wofl silent loadview  " Fix an edge-case with folding single-itens
filetype plugin on
let NERDTreeShowHidden=1                            " Shows hidden files (Files that starts with '.' (dot)
let NERDTreeIgnore = ['\.pyc$', '\.git$', '\.swp$', '__pycache__$', '.idea'] " Ignore some hidden files
nmap <leader><S-n> :NERDTreeToggle<CR>

let g:virtualenv_directory = $WORKING_DIR.'/virtualenvs'

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" buffer navigation
nmap <M-Right> :bn<CR>
nmap <M-Left> :bp<CR>
nmap <M-e> :bp<CR>:bd #<CR>
nmap <M-Up> :buffers<CR>

" pretify json
nmap <leader>j :%!python -m json.tool<CR>

" tagbar toggle
nmap <leader>t :TagbarToggle<CR>

" nerdtree toggle
nmap <leader><C-n> :NERDTreeToggle<CR>

" Startup Commands
if has("autocmd")
    " close vim if the only window left open is a NERDTree
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " toggle nerdtree while starting vim
    if has("gui_running")
        au VimEnter * NERDTreeToggle
        au VimEnter * NERDTree $WORKING_DIR
        au VimEnter * wincmd l
    endif
endif

nmap <F8> :TagbarToggle<CR>                 " F8 to Toggle TagBar
nmap <F9> :e ~/$VIMFILE<CR>                   " F9 to open vimrc file

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
" Tab navigation like Firefox.
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bnext<CR>
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

" CtrlP - Fuzzy Finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Gitgutter
nmap <leader>g :GitGutter

