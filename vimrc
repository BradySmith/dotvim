call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
set backupdir^=./.vim-backup/

" Save your swp files to a less annoying place than the current directory.
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=./.vim-swap//

" undofile - This allows you to use undos after exiting and restarting
if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo > /dev/null 2>&1
endif
set undodir=./.vim-undo//

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

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

:inoremap jk <esc>
:inoremap <esc> <NOP>
:noremap <Up> <NOP>
:noremap <Down> <NOP>
:noremap <Left> <NOP>
:noremap <Right> <NOP>

:iabbrev ssig Brady Smith, bas453, 11135973 
:iabbrev maxssig Max Gooding, mag501, 11087688
:iabbrev teh the

"Colorscheme
syntax enable
let g:solarized_termtrans=1
let g:solarized_termcolors=16
set background=dark
colorscheme solarized             " Load a colorscheme

"General Options
set tw=80                                       
set nu
set cc=80                                   
set autoindent 
set spell

"Search options
set ic
set smartcase
set incsearch

"Have it so we can run sql files on mydb at home
autocmd FileType sql let b:vimpipe_command="psql mydb"

nnoremap <Leader>u :GundoToggle<CR>


