set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'spf13/PIV'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'beyondwords/vim-twig'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'
Plugin 'sjl/gundo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scwood/vim-hybrid'
Plugin 'romainl/Apprentice'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" Let leader be space
nnoremap <SPACE> <Nop>
:let mapleader = " "

" Color Scheme.
" ============
colorscheme hybrid

highlight clear SignColumn
highlight clear LineNr
hi clear SpellBad
hi SpellBad cterm=underline

" General Settings
" ================

"Suck it Vimophiles
:set mouse=a

set wildignore+=app/cache/**/*,*/app/cache/*,*/tmp/*,*.so,*.swp,*.zip
set showmode
set backspace=indent,eol,start  " fix backspace
set number
set history=1000
set nospell
set clipboard=unnamed

"Get rid of annoying Press Enter or type command to continue...
let g:bufferline_echo=0

"No fold for you stupid php <PIV>!
set nofoldenable
autocmd Syntax php normal zR

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

:nnoremap <leader>ev :vsplit ~/.vim/vimrc<CR>
:nnoremap <leader>sv :source ~/.vimrc<CR>

:inoremap jk <esc>
:inoremap <esc> <NOP>
:noremap <Up> <NOP>
:noremap <Down> <NOP>
:noremap <Left> <NOP>
:noremap <Right> <NOP>

:nnoremap <silent> [b :bprevious<CR> 
:nnoremap <silent> ]b :bnext<CR> 
:nnoremap <silent> [B :bfirst<CR> 
:nnoremap <silent> ]B :blast<CR>

:nnoremap <leader>xs :let @/ = ""<CR>

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

nnoremap <silent><leader>ccc :call PhpCsFixerFixFile()<CR>

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
au FileType scss setl sw=2 sts=2 et

let g:DisableAutoPHPFolding = 1
let g:PIVAutoClose = 0

"Search settings
highlight clear SignColumn
highlight clear LineNr
set hlsearch
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set incsearch
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

" Cleans up trailing whitespace.
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position.
    let @/=_s
    call cursor(l, c)
endfunction

" Plugin Specific Stuff
" =====================

" Airline
let g:bufferline_echo = 0
let g:airline_section_c = '%f'
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" CtrlP should us `ag`.
if executable('ag')
    " Use ag over grep.
    set grepprg=ag\ --nogroup\ --nocolor
 
    " Use ag in CtrlP for listing files. Lightning fast and
    " respects .gitignore.
    let g:ctrlp_user_command = 'ag -i %s -l --nocolor --nogroup -g ""'
 
    " ag is fast enough that CtrlP doesn't need to cache.
    let g:ctrlp_use_caching = 0
endif

let g:autoclose_vim_commentmode = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:vdebug_options = {
    \ 'break_on_open': 1,
    \ 'port': '9001',
    \ 'path_maps': {"/clients/sites/dev/symfony": "/Users/brady/projects/DIW-web/symfony"},
    \ 'server': ''
    \}

"NERDTree
map <C-e> :NERDTreeToggle<CR>
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

"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>
