" vim-plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Brettm12345/moonlight.vim'

" Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'JakeBecker/elixir-ls', { 'do': { -> g:elixirls.compile() } }
Plug 'mhinz/vim-mix-format'

" pug
Plug 'digitaltoad/vim-pug'

" javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'javascript.jsx']}

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()
" }}}
" coc {{{
" let g:coc_global_extensions = [
"       \ 'coc-elixir', 'coc-eslint', 'coc-prettier',
"       \ 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin',
"       \ 'coc-css', 'coc-json', 'coc-yaml'
"       \]
" set updatetime=300
" }}}
" vars {{{
set clipboard+=unnamedplus
set fdm=marker
set bg=dark
set shiftwidth=2
set sts=2
set ts=2
set laststatus=1
set so=3
set magic
set et
set sta
set tgc
set rnu
set cul
set ai
set si
set nu
set undofile
set ignorecase
set guicursor=a:blinkon1
" }}}
" fzf {{{
let $FZF_DEFAULT_COMMAND = 'fd --type f'
" let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
" let $FZF_DEFAULT_OPTS .= '--inline-info'
" bugfix maybe fixed
" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_buffers_jump = 1
" }}}
" foldtext {{{
function! CustomFoldtext()
  " remove comments
  let line = substitute(getline(v:foldstart),
        \'\v\s*(' . substitute(&cms, '\s*%s', '', '') . '+)\s*', '', 'g')
  " remove marker
  let line = substitute(line, '\s*' . split(&foldmarker, ',')[0] . '\s*', '', 'g')
  let line = repeat(v:folddashes, 2) . ' ' . line
  let w = get(g:, 'custom_foldtext_max_width', winwidth(0)) - &foldcolumn - (&number ? 4 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat(" ", 4)
  let lineCount = line("$")
  let expansionString = repeat(' ', w - strwidth(foldSizeStr.line.foldLevelStr))
  return line . expansionString . foldSizeStr . foldLevelStr
endf
set foldtext=CustomFoldtext()
" }}}
" colorscheme {{{
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme palenight
" }}}
" keyboard {{{
nnoremap <C-p> :FZF<CR>

inoremap <expr><tab> pumvisible() ? "<c-n>": "\<tab>"
" nnoremap <silent><S-P> :Ag<CR>
" }}}
" whitespace {{{
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
" }}}
" elixir {{{
let g:mix_format_on_save = 1
" }}}
