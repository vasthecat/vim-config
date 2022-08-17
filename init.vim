set nocompatible
filetype plugin indent on
syntax on

set rtp+=$XDG_CONFIG_HOME/vim/
call plug#begin("$XDG_CONFIG_HOME/vim/plugins")
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
call plug#end()

let mapleader="\<Space>"

" Tab configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Automatically change current directory to be the same as the file editing
set autochdir 

" Paragraph formatter
let &formatprg="par -w80"

" Spelling
set spell spelllang=ru,en

" Change color scheme
set background=dark
colorscheme molokai

" Add vertical rulers
set colorcolumn=80,120
highlight ColorColumn ctermbg=8 guibg=lightgrey

" Disable swapfiles
set noswapfile
set backupdir=/tmp//

" Auto reload file if changed outside Vim
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Lightline status
set laststatus=2
set noshowmode

" Allow Vim to be controlled with mouse
set mouse=a

" Settings for gvim
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar
let &guifont="Menlo:h17"

" Set line numbering rules
set relativenumber number
au InsertEnter * set number norelativenumber
au InsertLeave * set relativenumber

" Remap splits shortcuts
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Better splits keybindings
nmap <leader>s  <ESC>:vsplit<CR>
nmap <leader>vs <ESC>:split<CR>

" NERDCommenter configuration
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1

" NERDCommenter shortcuts
nmap <leader>k <leader>c<space>
vmap <leader>k <leader>c<space>

" Copy to system clipboard
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d

