let mapleader = ' '
let maplocalleader = ','

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'elmcast/elm-vim'
Plug 'ervandew/supertab'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kana/vim-arpeggio'
Plug 'meck/vim-brittany'
Plug 'mileszs/ack.vim'
Plug 'miyakogi/seiya.vim'
Plug 'mlent/ale'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neovimhaskell/haskell-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'shawncplus/phpcomplete.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/paredit.vim'

call plug#end()

set mouse=a
set encoding=utf-8
set list

let g:ghcid_command = "ghcid --command=\"stack ghci $(basename $(pwd))\""
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['prettier', 'eslint']
let g:ale_linters['jsx'] = ['prettier', 'eslint']
let g:ale_linters['haskell'] = ['hlint']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

let g:brittany_on_save = 0

let g:elm_format_autosave = 1

" Javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0


"Colors etc

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

colorscheme PaperColor
let g:airline_theme="gruvbox"
set background=dark
set t_Co=256

let g:solarized_termcolors=256

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

set colorcolumn=80,120

" end colors
syntax on
filetype plugin indent on

set clipboard+=unnamedplus

" Set 80-char line color to dark gray
highlight ColorColumn ctermbg=DarkGray

nnoremap <silent> <leader><leader> :noh<CR><C-l>

" Snippets

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap <PageUp> <nop>
noremap <PageDown> <nop>

" Better search
set incsearch
set hlsearch
set smartcase
set ignorecase

" update faster
set updatetime=250

" Filename even with one window:
set laststatus=2

" Load ctags from codex.tags when available
set tags=tags;/,codex.tags;/

" Enough of this!
command! W w
command! Q q

" Background vim with spc-b
nnoremap <Leader>b <C-z>

" Exit terminal with ESC
tnoremap <ESC> <C-\><C-n>

" Line numbers
set number
set relativenumber
set numberwidth=2
highlight LineNr term=bold cterm=none ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr term=bold cterm=none ctermfg=DarkGreen ctermbg=NONE

" Default indentation:
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set expandtab

" highlight the current line in current window; may slow down redrawing
" for long lines or large files
set cursorline
set cursorcolumn
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

au TermOpen * setlocal nonumber norelativenumber

set scrolloff=5

let g:haskell_enable_quantification = 1
let g:haskell_classic_highlighting = 1
let g:haskell_indent_disable = 1

" haskell conceal
let g:haskell_conceal_wide = 1
let g:haskell_conceal_bad = 1

set nofoldenable

" markdown languages
let g:markdown_fenced_languages = ['java', 'haskell', 'javascript', 'ruby', 'c', 'cpp', 'php']

" incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap <Leader>v :vsplit<cr>
nnoremap <Leader>s :split<cr>
nnoremap <Leader>e :FZF<cr>

" Open terminal
" horizontal
nnoremap <Leader>st :split<CR><C-w><C-w>:term<CR>
nnoremap <Leader>vt :vsplit<CR><C-w><C-w>:term<CR>

" Stylish haskell
:nnoremap <leader>ss v_ip:!stylish-haskell <CR>

" Hindent
:nnoremap <leader>shi v_ip:!hindent <CR>

" Reload file with rr
nnoremap rr :w<CR>:so %<CR>

" Window cycle
map <Leader>w <C-w><C-w>

" NERDTree
nnoremap <Leader>ft :NERDTreeToggle<CR>

set ruler

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_matchpairs = "(:),{:}"
let delimitMate_expand_space = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 4
let g:haskell_tabular = 1

nnoremap <silent> <leader>rf :TREPLSendFile<cr>
nnoremap <silent> <leader>rs :TREPLSend<cr>
vnoremap <silent> <leader>rs :TREPLSend<cr>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <A-t> :terminal<CR>

" Map jk to esc (chord)
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" <leader>? gets full info about lint errors
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" ctags for haskell
" Add these to your vimrc to automatically keep the tags file up to date.
" Unfortunately silent means the errors look a little ugly, I suppose I could
" capture those and print them out with echohl WarningMsg.
augroup tags
  au BufWritePost *.hs            silent !init-tags %
  au BufWritePost *.hsc           silent !init-tags %
augroup END

augroup ale
  autocmd!
  autocmd CursorHold * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
augroup END

 "Temporary thing to replace some junk for Freckle

"
function! ReplaceLens()
    execute "normal! ma?@\<C-m>lyw`ahpxvUbvu"
endfunction

call setreg('l', ":call ReplaceLens()\<CR>")

" Format a comment block to 80 characters
" NOTE does not work
function! FormatComments()
    set tw=80
    execute "normal! gq"
    set tw=120
endfunction

" If you use qualified tags, then you have to change iskeyword to include
" a dot.  Unfortunately, that affects a lot of other commands, such as
" w, and \< \> regexes used by * and #.  For me, this is confusing because
" it's inconsistent with vim keys everywhere else.
" This binding temporarily modifies iskeyword just for the ^] command.
nnoremap <silent> <c-]> :setl iskeyword=@,_,.,48-57,39<cr><c-]>
    \:setl iskeyword=@,48-57,_,192-255<cr>

