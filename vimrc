set rtp+=/usr/share/vim/addons " see !so 836568
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line

" required
call vundle#end()
" required
filetype plugin indent on

" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" ======================================
" ======= Non-Vundle stuff below =======
" ======================================
" locate vimrc files: try ":echo $MYVIMRC" or ":scriptnames" or ":version"
" https://dougblack.io/words/a-good-vimrc.html
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

"https://stackoverflow.com/questions/307148/vim-scrolling-slowly
set ttyfast

" move viminfo file
set viminfo+=n~/.vim/viminfo

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" enable syntax processing
syntax enable

set tags+=../tags

" *** UI CONFIG ***

" show line numbers
set number
" show relative line numbers (hybrid)
set relativenumber
" show command in bottom bar
set showcmd
" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu
" redraw only when we need to.
set lazyredraw

" highlight matching [{()}]
"set showmatch
" don't highlight matching [{()}]
"set noshowmatch

" *** BUFFER CYCLING ***
" use :b-[1-9] to quickly switch to buffer
" use :ls to list buffers
" cycle through buffers with <ALT><Left> and <ALT><Right>
:nmap <M-Left> :bprev<CR>
:nmap <M-Right> :bnext<CR>

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


" *** SEARCHING ***

" search as characters are entered
set incsearch
" highlight matches
set hlsearch

" turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" *** INDETING ***
" see below at autocommands
filetype indent on


" *** FOLDING ***

" enable folding
set foldenable
" open most folds by default (0=all folded, 99=all unfolded)
set foldlevelstart=10
"" 10 nexted fold max (???)
"set foldnestmax=10

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
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

" *** SPACES & TABS *** => See Autocommands

" number of visual spaces per TAB
"set tabstop=4

" number of spaces in tab when editing
"set softtabstop=4

" tabs are spaces
"set expandtab

" shiftwidth
"set shiftwidth=4

" *** AIRLINE *** "
" https://github.com/vim-airline/vim-airline
:helptags ~/.vim/pack/dist/start/vim-airline/doc
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" *** POWERLINE ***
"
" https://powerline.readthedocs.io/en/latest/usage/other.html#vim-statusline
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
" Always display the statusline in all windows
"set laststatus=2
" Always display the tabline, even if there is only one tab
"set showtabline=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set noshowmode

" *** You Complete Me ***

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" *** COMMAND SHORTCUTS ***

" Allow saving as sudo when forgot to sudo vim !so 260078
cmap w!! w !sudo tee > /dev/null %

" *** AUTOCMDS ***

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=8 expandtab autoindent smartindent
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 tabstop=8 expandtab autoindent smartindent

" LINUX KERNEL CODING STYLE
" https://github.com/vivien/vim-linux-coding-style
let g:linuxsty_patterns = [ "/usr/src/", "/linux", "/Sigrok/libsigrok/"]


"set maximum textwidth
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

"delete trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

