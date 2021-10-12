set encoding=utf-8
set fileencoding=utf-8

set nocompatible
syntax enable
filetype plugin on
set path +=**
set wildmenu
set clipboard^=unnamed,unnamedplus

let mapleader = " "
let maplocalleader = " "

" -- use the current working directory
let g:rg_derive_root='true'

nnoremap Y y$<Esc>
nnoremap <C-n> :bn<cr>
nnoremap <C-b> :bp<cr>
nnoremap <leader>sm :Gvsplit master:%<cr>
nnoremap <leader>dm :Gvdiff master:%<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>e $p
nnoremap <c-s> :wa<cr>
nnoremap <c-q> :q!<cr>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap <c-o> <c-o>zzzv
nnoremap <c-i> <c-i>zzzv

inoremap <c-a> <c-r>"
inoremap <c-e> <c-r>.

inoremap <Left> <nop>
inoremap <Right> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"
" resizing windows
noremap <Up> :res -3<cr>
noremap <Down> :res +3<cr>
inoremap <Up> :res -3<cr>
inoremap <Down> :res +3<cr>
noremap <Left> :vertical resize -3<cr>
noremap <Right> :vertical resize +3<cr>
inoremap <Left> :vertical resize -3<cr>
inoremap <Right> :vertical resize +3<cr>

" run python print some debug info and run tests
nnoremap <F6> :CocCommand python.execInTerminal<cr>
nnoremap <F9> <esc>:w<cr>:lcd %:p:h<cr>:!~/.local/bin/cf test<cr>
nnoremap <Space><F9> <esc>:w<cr>:lcd %:p:h<cr>:!~/.local/bin/cf submit<cr>
nmap <silent> <F8>  <Plug>(coc-diagnostic-next)
nnoremap <leader>d oprint('<esc>pa: ', <esc>pa)<esc>
nnoremap <silent> <leader>ct :!ctags -R --exclude=*.js<CR>

" edit vimrc
:nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
:nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" explorer
:nmap <space>f :CocCommand explorer<CR>

"" Do not ring errors
set noerrorbells
set novisualbell

" macro to change [] to get()
let @g='f[c .get(lxf]r)'

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set notermguicolors
if has('termguicolors')
  set termguicolors
endif
set guicursor=
set smartcase
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set scrolloff=6

"" Lines range visible when scrolling
set scrolloff=10

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'guns/xterm-color-table.vim'

"  color schemes
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'bignimbus/pop-punk.vim'

call plug#end()


" -- abbreviations
inorea mai_ if __name__ == '__main__':<cr>main()
inorea dec_ def decorator(func):
\<cr>@functools.wraps(func)
\<cr>def wrapper_decorator(*args, **kwargs):
\<cr># Do something before
\<cr>value = func(*args, **kwargs)
\<cr># Do something after
\<cr>return value
\<cr>return wrapper_decorator<esc>

" -- fzf with ripgrep
nnoremap \ :CocSearch<space><C-r>0
nnoremap <C-T> :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :BLines<cr>

set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]

colorscheme gruvbox
highlight Normal ctermbg=NONE

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <C-p> :GFiles<CR>
inoremap <C-c> <esc>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart<CR>

" -- sessions

" Automatically save the current session whenever vim is closed
autocmd VimLeave * mksession! ~/.config/nvim/sessions/shutdown_session.vim
nnoremap <F4> :source ~/.config/nvim/sessions/shutdown_session.vim<CR>
nnoremap <F2> :mksession! ~/.config/nvim/sessions/manual_session.vim<cr>
nnoremap <F3> :source ~/.config/nvim/sessions/manual_session.vim<cr>

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
