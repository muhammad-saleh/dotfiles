" System
set shell=/bin/bash
set clipboard=unnamed
set nocompatible
filetype off

set ruler
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
" set rtp+=/usr/local/bin/fzf
source ~/.fzf/plugin/fzf.vim
call vundle#begin()

" Github Bundles
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'RRethy/vim-illuminate'
Plugin 'tpope/vim-unimpaired'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'trevordmiller/nova-vim'
"Plugin 'Khaledgarbaya/night-owl-vim-theme'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jremmen/vim-ripgrep'
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'ayu-theme/ayu-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'mhartington/oceanic-next'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin on

set conceallevel=0
let g:deoplete#enable_at_startup = 1

" Nerdtree configuration
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30

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
colorscheme palenight
filetype plugin indent on


" set colorcolumn=80

" Spacing and Wrapping
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab
set mouse=a

" Interface
set showcmd

" Editing
set smartindent
set showmode
set list listchars=tab:>>,eol:¬,trail:·
set rnu
set number
set backspace=indent,eol,start
set noerrorbells
 set cursorline

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

hi clear VertSplit
hi VertSplit ctermbg=none ctermfg=black
set fillchars+=vert:\│

"filetype plugin on
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
let g:ycm_key_list_select_completion = ['<Down>']
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
autocmd BufWritePost $MYVIMRC source $MYVIMRC

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


function! FZFRg(...)
    return 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.a:1.' -g *.{'.get(a:, 2, "*").'}'
endfunction

command! -bang -nargs=* Find call fzf#vim#grep(FZFRg(<f-args>), 1, <bang>0)


" YouCompleteMe and UltiSnips compatibility. pre-req in autoload: (https://github.com/wincent/wincent/blob/9b938b4d879a2/roles/dotfiles/files/.vim/plugin/autocomplete.vim)
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
let g:UltiSnipsSnippetsDir = '/Users/saleh/Library/Mobile Documents/com~apple~CloudDocs/VimUltisnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips','/Users/saleh/Library/Mobile Documents/com~apple~CloudDocs/VimUltisnips']





