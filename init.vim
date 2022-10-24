set nocompatible
filetype plugin indent on
syntax on

let g:vim_home = $XDG_CONFIG_HOME . "/vim/"
let $VIMHOME = g:vim_home
set rtp+=$VIMHOME
call plug#begin("$VIMHOME/plugins")
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
" Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'hrsh7th/vim-vsnip'

" Languages
Plug 'prabirshrestha/vim-lsp'
Plug 'lervag/vimtex'
Plug 'preservim/vim-markdown'
call plug#end()

let mapleader="\<Space>"

" Tab configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

" Show whitespace characters
set listchars=tab:├─┤,trail:␠,nbsp:⎵,lead:·
set list

" Trailing whitespace trimmer
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
nmap <Leader>f :retab <bar> TrimWhitespace<CR>

" Automatically change current directory to be the same as the file editing
set autochdir

" Remove conceal for all files
set conceallevel=0

" Paragraph formatter
let &formatprg="par -w80"

" Spelling
set spell spelllang=ru,en

" Change color scheme
set background=dark
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
    set antialias
    set macligatures
    set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
    set guioptions+=k
    let &guifont="Fira Code:h17"
    colorscheme ayu
else
    colorscheme molokai
endif

" Add vertical rulers
set colorcolumn=81,121
highlight ColorColumn ctermbg=8 guibg=#3E4B59

" Auto reload file if changed outside Vim
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Allow Vim to be controlled with mouse
set mouse=a

" Set line numbering rules
set relativenumber number
au InsertEnter * set number norelativenumber
au InsertLeave * set relativenumber

" Remap splits shortcuts
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Remap horizontal window resizing
nmap <leader>. <C-W>>
nmap <leader>, <C-W><

" Better splits keybindings
nmap <leader>s  <ESC>:vsplit<CR>
nmap <leader>vs <ESC>:split<CR>

" Copy to system clipboard
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d

" Terminal mode
tnoremap <leader><ESC> <C-\><C-n>
au TerminalOpen * setlocal nospell

" Tabs
nmap <leader>tn :tabnew<CR>
nmap <leader>tt :tab :term<CR>
nmap <leader>th :tabprevious<CR>
nmap <leader>tl :tabnext<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>t, :tabmove -1<CR>
nmap <leader>t. :tabmove +1<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

"+---------+"
"| PLUGINS |"
"+---------+"

" Lightline status
set laststatus=2
set noshowmode
if has("gui_running")
    let g:lightline_colorscheme = 'ayu'
else
    let g:lightline_colorscheme = 'powerline'
endif
let g:lightline = {
      \ 'colorscheme': g:lightline_colorscheme,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" NERDCommenter configuration
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
nmap <leader>; <leader>c<space>
vmap <leader>; <leader>c<space>

" Indent line guides plugin
let g:indentLine_color_gui = '#FFFFFF'
let g:indentLine_color_term = 15
let g:indentLine_char = '·'

" VimTeX
let g:vimtex_syntax_conceal_disable = 1

" fzf-vim
let g:project_dir = getcwd()
fun! ProjectMark()
    let g:project_dir = getcwd()
endfun
command! ProjectMark call ProjectMark()
nmap <leader>pp :call ProjectMark()<CR>
nmap <leader>pf :call fzf#vim#files(g:project_dir)<CR>
nmap <leader>pb :Buffers<CR>

" vim-vsnip
let g:vsnip_snippet_dir = g:vim_home . "snippets/"
imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

" vim-lsp
source $VIMHOME/lsp.vim

"+-----------------+"
"| FILETYPE CONFIG |"
"+-----------------+"

fun! s:FiletypeTex()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfun
autocmd FileType tex call s:FiletypeTex()

fun! s:FiletypeJSON()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfun
autocmd FileType json call s:FiletypeJSON()
