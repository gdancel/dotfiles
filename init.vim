"Preferences
filetype plugin indent on
syntax on
color ryuuko
set autoindent
set ignorecase
set smartcase
set number
set cmdheight=2
set pastetoggle=<F10>
set so=5

"Clipboard
set clipboard=unnamed
set hidden
set wildmenu
set showcmd
set hlsearch

"Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'derekwyatt/vim-scala'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ensime/ensime-vim'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

call plug#end()

"Airline
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='solarized'

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={} 
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips'] 
let g:deoplete#omni#input_patterns={} 
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

"Neomake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

"vim-jsx
let g:jsx_ext_required = 0

"Ctrl-P
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'

"Mappings
map Y y$
nnoremap <C-n> :NERDTreeToggle<CR>
