" System
set shell=/bin/bash
set clipboard=unnamed
set nocompatible
filetype off

set ruler
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
" set rtp+=/usr/local/bin/fzf
call vundle#begin()

" Github Bundles
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'arcticicestudio/nord-vim'
Plugin 'chriskempson/base16-vim'
"Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'RRethy/vim-illuminate'
Plugin 'tpope/vim-unimpaired'
"Plugin 'airblade/vim-gitgutter'
Plugin 'trevordmiller/nova-vim'
Plugin 'Khaledgarbaya/night-owl-vim-theme'
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
Plugin 'ryanoasis/vim-devicons'
"Plugin 'Quramy/tsuquyomi'
Plugin 'sickill/vim-monokai'
Plugin 'valloric/MatchTagAlways'
Plugin 'larsbs/vimterial_dark'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'dimonomid/vim-vimprj'
"Plugin 'dimonomid/vim-indexer'
"Plugin 'dimonomid/vim-dfrank-util'
Plugin 'mattn/emmet-vim'
Plugin 'Galooshi/vim-import-js'
Plugin 'junegunn/limelight.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'simeji/winresizer'
Plugin 'prettier/vim-prettier'
Plugin 'junegunn/seoul256.vim'
Plugin 'sheerun/vim-polyglot'
" LSP Config
"Plugin 'prabirshrestha/async.vim'
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'ryanolsonx/vim-lsp-typescript'
"Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'junegunn/vim-peekaboo'

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
endif

set laststatus=2
let g:lightline = {
  \ 'component': {
  \   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
  \ }
  \ }

Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/Users/saleh/.nvm/versions/node/v10.6.0/bin/javascript-typescript-stdio'],
    \ 'typescript': ['/Users/saleh/.nvm/versions/node/v10.6.0/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Fix indentation in visual mode
vnoremap > >gv
vnoremap < <gv

set omnifunc=syntaxcomplete#Complete

if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
endif

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin on

set conceallevel=0
let g:deoplete#enable_at_startup = 1
set cursorline

" Nerdtree configuration
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Syntax Highlighting
set t_Co=256
syntax enable
let g:seoul256_background = 236
colo seoul256
set background=dark
"colorscheme palenight
"colorscheme gruvbox
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

" Searching
set incsearch
set hlsearch
set ignorecase smartcase

" File Storage
set autoread
set noswapfile
set nobackup
set nowritebackup

" Cursor shape
" That's for iTerm2 in Tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Undo
"
set undofile
set undodir=~/.vim/undo

" Leader
let mapleader = ','
map <leader>n :NERDTreeToggle<CR>
map <leader>b :Buffers<CR>
map <leader><leader>f :Buffers<CR>

" move around with the arrow keys
noremap <silent> <Right> <c-w>l
noremap <silent> <Left> <c-w>h
noremap <silent> <Up> <c-w>k
noremap <silent> <Down> <c-w>j

" Cycle through open buffers


" Config
map <leader>c :e ~/.vimrc<CR>
" Reload Config
map <leader>R :so ~/.vimrc<CR>
" Reload Tags
map <leader>T :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR><CR>
" Run
map <leader>r :NERDTreeFind<CR>
" Run Rspec
map <leader>t :!rspec %<CR>
" Rails Bundle
map <leader>rbi :!bundle<CR>
" VIM Bundle
map <leader>B :BundleInstall<CR>q

map <leader>f :FZF<CR>
map <leader>F :Buffers<CR>

hi StatusLine ctermbg=green ctermfg=black
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

hi clear VertSplit
hi VertSplit ctermbg=none ctermfg=black
set fillchars+=vert:\│

let delimitMate_expand_cr=1

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

let g:fzf_files_options =
      \ '--preview "(bat {}) 2> /dev/null | head -'.&lines.'"'


" YouCompleteMe and UltiSnips compatibility. pre-req in autoload: (https://github.com/wincent/wincent/blob/9b938b4d879a2/roles/dotfiles/files/.vim/plugin/autocomplete.vim)
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
let g:UltiSnipsSnippetsDir = '/Users/saleh/Library/Mobile Documents/com~apple~CloudDocs/VimUltisnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips','/Users/saleh/Library/Mobile Documents/com~apple~CloudDocs/VimUltisnips']





