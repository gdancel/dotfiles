"Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-sbt'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ensime/ensime-vim', { 'do': 'UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

call plug#end()

" Preferences
filetype plugin indent on
let maplocalleader = "\\"
set autoindent
set ignorecase
set smartcase
set number
set cmdheight=2
set pastetoggle=<F10>
set so=5
set mouse=a
set relativenumber
set cursorline
syntax enable

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"Theme
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
color gruvbox
let g:gruvbox_contrast_dark="hard"

" Clipboard
set clipboard=unnamed
set hidden
set wildmenu
set showcmd
set hlsearch

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
inoremap <expr><tab> pumvisible() ? "<c-n>": "\<tab>"

" Neomake
" autocmd! BufWritePost * Neomake
autocmd BufWritePost * StripWhitespace
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint']
" let g:neomake_logfile = '/usr/local/var/log/neomake.log'
" let g:neomake_open_list = 0

" vim-jsx
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

"ack / ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

" Ensime
autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala nnoremap <localleader>dv :EnDeclarationSplit v<CR>
au FileType scala nnoremap <localleader>ds :EnDeclarationSplit<CR>
" let g:ensime_server_v2 = 1
