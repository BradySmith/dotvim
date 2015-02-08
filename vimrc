set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'spf13/PIV'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'beyondwords/vim-twig'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'spf13/vim-colors'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" Let leader be space
nnoremap <SPACE> <Nop>
:let mapleader = " "

" Color Settings
" ==============
color Tomorrow-Night 
set t_Co=256
set background=dark

" General Settings
" ================
"
"Suck it Vimophiles
:set mouse=a

set wildignore+=app/cache/**/*,*/app/cache/*,*/tmp/*,*.so,*.swp,*.zip
set showmode
set backspace=indent,eol,start  " fix backspace
set number
set history=1000
set nospell

"Get rid of annoying Press Enter or type command to continue...
let g:bufferline_echo=0

"No fold for you stupid php <PIV>!
set nofoldenable
let g:DisableAutoPHPFolding = 1

" Formating Options
" =================

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" Custom keybinds
" ===============

:nnoremap <leader>ev :split ~/.vim/vimrc<CR>
:nnoremap <leader>sv :source ~/.vim/vimrc<CR>

:inoremap jk <esc>
:inoremap <esc> <NOP>
:noremap <Up> <NOP>
:noremap <Down> <NOP>
:noremap <Left> <NOP>
:noremap <Right> <NOP>

"Select the word under the cursor
:noremap <space> viw

"Move line of text either up or down using - and _
noremap _ :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap - ddp

"Make current word uppercase
noremap <c-u> viwU

"Underline the current line with - or = depending on key that was used
:noremap <leader>u yyp<c-v>$r-
:noremap <leader>U yyp<c-v>$r=

"Faster leader shortcuts
:noremap <leader>a @
:noremap <leader>w :w<CR>
nmap <Leader><Leader> V

"File specific settings
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
au FileType css setl sw=2 sts=2 et
autocmd BufRead,BufNewFile *.less setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et
au FileType php setl sw=4 sts=4 et

let g:DisableAutoPHPFolding = 0
let g:PIVAutoClose = 0

"Search settings
highlight clear SignColumn
highlight clear LineNr
set hlsearch
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"Sessions
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Undo Settings
" =============

"Set Directories for backups
"tell it to use an undo file
set undofile

"set a directory to store the undo history
if isdirectory($HOME . '/.vim-backup') == 0
  :silent !mkdir -p ~/.vim-backup >/dev/null 2>&1
endif
set backupdir=~/.vim-backup/

"Save your swp files to a less annoying place than the current directory.
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap//

"undofile - This allows you to use undos after exiting and restarting
if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo > /dev/null 2>&1
endif
set undodir=~/.vim-undo//

" Stupid mispellings
" ==================
:ca X x
:ca W w
:iabbrev teh the


" Plugin Specific Stuff
" =====================
let g:autoclose_vim_commentmode = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:vdebug_options = {
    \ 'break_on_open': 1,
    \ 'port': '9001',
    \ 'path_maps': {"/clients/sites/dev/symfony": "/Users/ryan/Code/DIW-web/symfony"},
    \ 'server': ''
    \}

"NERDTree
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
map <leader>ms :mksession ~/.session.vim<CR>
map <leader>ss :source ~/.session.vim<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
elseif empty(argv(0))
    bd
    autocmd vimenter * exe "cd ."
    autocmd VimEnter * NERDTree
endif

"Gundo
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>o :CtrlP<CR>


"Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"Set it up so that supertab and snipmate work together
let g:SuperTabDefaultCompletionType = "context"
let g:closetag_html_style=1
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"CtrlP
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'


if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    if !exists('g:override_spf13_bundles')
        set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

