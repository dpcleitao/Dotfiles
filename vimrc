call plug#begin()
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'

" General
Plug 'tpope/vim-sensible'

" Text editing
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
" Plug 'tomtom/tcomment_vim'

"Search and replace
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'

" Linters
Plug 'w0rp/ale'

" Language Support
Plug 'sheerun/vim-polyglot'
" Plug 'joukevandermaas/vim-ember-hbs'
" Plug 'dustinfarris/vim-htmlbars-inline-syntax'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Themes
Plug 'joshdick/onedark.vim'

" Layout
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'

" Testing
Plug 'janko-m/vim-test'

" File editing
Plug 'henrik/rename.vim'
call plug#end()

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
let mapleader = ","

set nocompatible                             " Turn off vi compatibility.
set encoding=utf8

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ------------------------------------------------------------------------------
" Text Editing
" ------------------------------------------------------------------------------
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" treat *.thor files as ruby files
au BufNewFile,BufRead *.thor set filetype=ruby

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=2                     " Set tab to equal 4 spaces.
set softtabstop=2                 " Set soft tabs equal to 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.

set smarttab                      " Insert spaces in front of lines.
set list listchars=tab:»·,trail:·,nbsp:· " Show leading whitespace
set nojoinspaces                  " Use one space, not two, after punctuation.

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != "diff"
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=""
        call winrestview(l:winview)
    endif
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>

" ------------------------------------------------------------------------------
" Ctrl-p
" ------------------------------------------------------------------------------
let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" ------------------------------------------------------------------------------
"  Search and Replace
" ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.

set grepprg=ag\ --nogroup\ --nocolor

if !exists(":Ag")
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

cnoreabbrev ag Ag

" ------------------------------------------------------------------------------
"  Status Line
" ------------------------------------------------------------------------------
set laststatus=2                  " Always display the status line

" ------------------------------------------------------------------------------
"  Presentation
" ------------------------------------------------------------------------------

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" ------------------------------------------------------------------------------
" Linter Config
" ------------------------------------------------------------------------------
let g:ale_sign_column_always = 1

" ------------------------------------------------------------------------------
" Testing
" ------------------------------------------------------------------------------
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ------------------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------------------

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != "diff"
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=""
        call winrestview(l:winview)
    endif
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>


" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
