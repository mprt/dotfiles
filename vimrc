" https://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
" https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1
" locate vimrc files: try ":echo $MYVIMRC" or ":scriptnames" or ":version"
" https://dougblack.io/words/a-good-vimrc.html
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
" Debug stuff:
" :version
" :set runtimepath?
" https://stackoverflow.com/questions/48933/how-do-i-list-loaded-plugins-in-vim
" :scriptnames            : list all plugins, _vimrcs loaded (super)
" :verbose set history?   : reveals value of history and where set
" :function               : list functions
" :func SearchCompl       : List particular function

" *** VUNDLE *** -------------------------------------------------------------- 
" set rtp+=/usr/share/vim/addons " see !so 836568
" set rtp+=~/.vim/bundle/Vundle.vim

" locate vimrc files: try ":echo $MYVIMRC" or ":scriptnames" or ":version"
" https://dougblack.io/words/a-good-vimrc.html
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

"https://stackoverflow.com/questions/307148/vim-scrolling-slowly
set ttyfast
set nocompatible

" move viminfo file
set viminfo+=n~/.vim/viminfo

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set termguicolors
set background=dark
colorscheme solarized8
" https://github.com/flazz/vim-colorschemes
" https://github.com/lifepillar/vim-solarized8

" enable syntax processing
syntax enable

filetype plugin indent on

set encoding=utf-8

" search for tags file in directory of current file. then move upward until /
" see :h file-searching for information on ';'
set tags=./tags;/
" set tags+=../tags

" Delete comment character when joining commented lines
set formatoptions+=j

" *** UI CONFIG ***

" show line numbers
set number

" show relative line numbers (hybrid)
"set relativenumber

" show count when searching a string
set shortmess-=S

" show command in bottom bar
set showcmd

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu
set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp
set wildmode=longest:list,full

" redraw only when we need to.
set lazyredraw

" highlight matching [{()}]
set showmatch
"set noshowmatch

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=5

" make backspace work in gvim (!so 5419848)
set backspace=2

" Always display the statusline in all windows
"set laststatus=2
" Always display the tabline, even if there is only one tab
set showtabline=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set noshowmode

" *** BUFFER CYCLING ***
" use :b-[1-9] to quickly switch to buffer
" use :ls to list buffers
" cycle through buffers with <ALT><Left> and <ALT><Right>
:nmap <M-Left> :bprev<CR>
:nmap <M-Right> :bnext<CR>

" *** NETRW ***
" suppress banner
let g:netrw_banner = 0

"3: tree style listing
let g:netrw_liststyle = 3

"0: re-using the same window  (default)
"1: horizontally splitting the window first
"2: vertically   splitting the window first
"3: open file in new tab
"4: act like "P" (ie. open previous window)
let g:netrw_browse_split = 4

let g:netrw_winsize = 20



" *** LEADER SHORTCUTS ***

" leader is comma (instead of \ )
let mapleader=","

" jk is the new escape (better to reach)
inoremap jk <Esc>

" toggle gundo.vim
nnoremap <leader>u :GundoToggle<CR>

" shortcut to edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" shortcut to load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" shortcut to ^] (jump to tag) (german keyboard)
nnoremap <leader>t <C-]>


" convenience shortcuts for buffers, marks, undolist ( https://vi.stackexchange.com/questions/8451 )
" list and prepopulate
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>m :<C-u>marks<CR>:normal! `
nnoremap <leader>u :undolist<CR>:u<Space>


" *** SEARCHING ***

" search as characters are entered
set incsearch
" highlight matches
set hlsearch

set smartcase

" turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>


" *** FOLDING ***

" enable folding
set foldenable
" open most folds by default (0=all folded, 99=all unfolded)
set foldlevelstart=10
" maximum 10 nested folds for syntax and indent folding
set foldnestmax=10

" open/close folds with <space> instead of <za>
nnoremap <space> za

set foldmethod=syntax
"set foldmethod=indent


" *** MOVEMENT ***

"nnoremap j gj           " move vertically by visual line
"nnoremap k gk           " move vertically by visual line

"nnoremap B ^           " move to beginning/end of line
"nnoremap E $           " move to beginning/end of line
"nnoremap $ <nop>       " $/^ doesn't do anything
"nnoremap ^ <nop>       " $/^ doesn't do anything

" facilitate switching windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Hard Mode (for learning)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

" *** AIRLINE *** "
" https://github.com/vim-airline/vim-airline
":helptags ~/.vim/pack/dist/start/vim-airline/doc
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" *** You Complete Me *** -------------------------------------------------------------- {{{
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" }}}


" *** COMMAND SHORTCUTS *** -------------------------------------------------------------- {{{
" Allow saving as sudo when forgot to sudo vim !so 260078
cmap w!! w !sudo tee > /dev/null %

" delete buffer, but keep split window ( !so 4465095 )
cnoremap bc bp\|bd #


" }}}

" *** AUTOCMDS *** -------------------------------------------------------------- {{{

" Alternatively use BufRead/NewFile Events (!so18231)
" Also, you can detect endings like this 
"autocmd BufRead,BufNewFile *.c, *.h, *.cpp *.py ...

augroup filetype_block
                autocmd!

        autocmd FileType vim setlocal foldmethod=marker

                autocmd Filetype c,cpp set textwidth=79 tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent smartindent fileformat=unix "filetype=c.doxygen

                autocmd FileType python set textwidth=79 tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent smartindent fileformat=unix 

"delete trailing whitespace
                autocmd BufWritePre *.py :%s/\s\+$//e
augroup END

" }}}


" *** C BUILD SYSTEM *** -------------------------------------------------------------- {{{

" configure make (! mark prevents Vim from jumping to location of first error found)
set makeprg=make\ -C\ ~/training-m/build\ 10-test\ 10-quiz
nnoremap <F4> :make!<cr>

" Configure Launch
nnoremap <F5> :!~/training-m/build/bin/test
nnoremap <F6> :!~/training-m/build/bin/app

" Configure CMake ( doesn't work?)
nnoremap <F3> :!cmake\ -B\ ~/training/build\ -S\ ~/training

" }}}

" LINUX KERNEL CODING STYLE
" https://github.com/vivien/vim-linux-coding-style
let g:linuxsty_patterns = [ "/usr/src/", "/linux", "/Sigrok/libsigrok/"]


" GUI SETTINGS -------------------------------------------------------------- {{{
" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone, colorscheme and font
    set background=dark
    colorscheme molokai
    colorscheme desert
    " Font Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Ubuntu_Mono_derivative_Powerlin:h10
    "set guifont=Monospace\ Regular\ 12
    "set guifont=Noto_Mono_for_Powerline:h9:cANSI:qDRAFT

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}

