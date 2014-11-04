call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

source ~/.vim/scripts/closetag.vim

"Automagically use same vimrc allover the place by creating symbolic link
"set runtimepath^=~/Dropbox/vim
"source ~/Dropbox/vim/vimrc.vim
:fixdel
:let mapleader = ","

:nnoremap <leader>ev :vsplit ~/.vim/vimrc<CR>
:nnoremap <leader>sv :source ~/.vim/vimrc<cr>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"Set Directories for backups
" tell it to use an undo file
set undofile
" set a directory to store the undo history
if isdirectory($HOME . '/.vim-backup') == 0
  :silent !mkdir -p ~/.vim-backup >/dev/null 2>&1
endif
set backupdir=~/.vim-backup/

" Save your swp files to a less annoying place than the current directory.
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap//

" undofile - This allows you to use undos after exiting and restarting
if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo > /dev/null 2>&1
endif
set undodir=~/.vim-undo//

" Set paste toggle to F3
set pastetoggle=<F3>

" Select the word under the cursor
:noremap <space> viw

"Move line of text either up or down using - and _
noremap _ :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap - ddp

"Make current word uppercase
noremap <c-u> viwU

"Underline the current line with - or = depending on key that was used
:noremap <leader>u yyp<c-v>$r-
:noremap <leader>U yyp<c-v>$r=

"Remap @ to leader a for faster macro access
:noremap <leader>a @

"Resize windows using the + or - buttons
:nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
:nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

:inoremap jk <esc>
:inoremap <esc> <NOP>
:noremap <Up> <NOP>
:noremap <Down> <NOP>
:noremap <Left> <NOP>
:noremap <Right> <NOP>

:iabbrev ssig Brady Smith, bas453, 11135973 
:iabbrev teh the

"Colorscheme
syntax enable
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
colorscheme heroku             " Load a colorscheme

"General Options
set nu
set autoindent 
set tabstop=4
set smartindent
set tabstop=4
set linespace=3

set ic
set smartcase
set incsearch


nnoremap <Leader>u :GundoToggle<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

:set splitright

"Set it up so that supertab and snipmate work together
let g:SuperTabDefaultCompletionType = "context"
let g:closetag_html_style=1

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
