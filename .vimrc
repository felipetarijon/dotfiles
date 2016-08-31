" ~/.vimrc
" Maintainer: Felipe Tarijon de Almeida <felipest9@gmail.com>
" Description: vim initialization file
" Version: 20160831.0
"
" Help? Press K while the cursor is in the keyword

" ========
"  COLORS
" ========
colorscheme blue
syntax enable

" ===============
"  SPACES & TABS
" ===============
set tabstop=4		" Number of visual spaces per TAB
set softtabstop=4	" Number of spaces while editing
set expandtab 		" Tabs are spaces

" ===========
"  UI CONFIG
" ===========
set number		" Show line numbers
set showcmd		" Show command in bottom bar
set cursorline		" Highlight current line
filetype indent on	" Load a specific filetype ident file
set wildmenu		" Visual autocomplete for command menu
set lazyredraw		" Redraw only when we need to
set showmatch		" Highlight {[()]}

" ===========
"  SEARCHING
" ===========
set incsearch		" Search as characters are entered
set hlsearch		" Highlight matches
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" =========
"  FOLDING
" =========
set foldenable 		" Enable folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested fold maximum
nnoremap <space> za	" Space open/closes folds
