" System
set shell=/bin/bash
set clipboard=unnamed
set nocompatible
filetype off

set ruler
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" Github Bundles
Plugin 'danro/rename.vim'
Plugin 'docunext/closetag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'kana/vim-fakeclip'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/neocomplete.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'leafgarland/typescript-vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'ap/vim-css-color'
Plugin 'RRethy/vim-illuminate'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'HerringtonDarkholme/yats.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin on

set conceallevel=0
let g:deoplete#enable_at_startup = 1

" Indent Guides configuration
let g:indentguides_spacechar = '┆'

" Trailing Whitespace configuration
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" CtrlP configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

" Nerdtree configuration
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 50

let g:airline#extensions#tabline#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Syntax Highlighting
set t_Co=256
syntax enable
set background=dark
colorscheme lucario
filetype plugin indent on
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'

" set colorcolumn=80

" Spacing and Wrapping
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab

" Interface
set showcmd

" Editing
set smartindent
set showmode
set showmatch
set list listchars=tab:>>,eol:¬,trail:·
set rnu
set number
set backspace=indent,eol,start
set cursorline
set cursorcolumn
set noerrorbells

" Multipurpose Tab Key
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Searching
set incsearch
set hlsearch
set ignorecase smartcase

" File Storage
set autoread
set noswapfile
set nobackup
set nowritebackup

" Undo
"
set undofile
set undodir=~/.vim/undo

" Leader
let mapleader = ','
map <leader>n :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>

" move around with the arrow keys
noremap <silent> <Right> <c-w>l
noremap <silent> <Left> <c-w>h
noremap <silent> <Up> <c-w>k
noremap <silent> <Down> <c-w>j

" Command
map <leader><leader> :
" Config
map <leader>c :e ~/.vimrc<CR>
" Reload Config
map <leader>R :so ~/.vimrc<CR>
" Reload Tags
map <leader>T :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR><CR>
" Run
map <leader>r :!source %<CR>
" Run Rspec
map <leader>t :!rspec %<CR>
" Rails Bundle
map <leader>rbi :!bundle<CR>
" VIM Bundle
map <leader>B :BundleInstall<CR>q

map <leader>f :FZF<CR>

hi StatusLine ctermbg=green ctermfg=black
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

filetype plugin on

" NERDTree Integration
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd BufEnter * if &filetype !=# 'nerdtree' | NERDTreeFind | wincmd p | endif
"
"
set conceallevel=0
let g:indentLine_setConceal = 0
autocmd BufWritePost $MYVIMRC source $MYVIMRC
