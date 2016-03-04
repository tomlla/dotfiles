call plug#begin('~/.vim/plugged')

"--- color scheme ---
Plug 'nanotech/jellybeans.vim'
"Plug 'vim-scripts/desertEx'
"Plug 'vim-scripts/newspaper.vim'
"Plug 'vim-scripts/candy.vim'
"Plug 'luckydev/150colors'
"
" --- dev-support for specific language ---
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go'
Plug 'artur-shaik/vim-javacomplete2'

" === syntax highlight ===
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'kana/vim-filetype-haskell', {'for': 'haskell'}
Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}
" === unite ware ===
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'sorah/unite-ghq'
" === markdown ===
Plug 'kannokanno/previm', { 'for': ['mkd','md','markdown']}
"Plug 'vim-voom/VOoM', { 'for': ['mkd','md','markdown']}

"Plug 'ujihisa/quickrun'
Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-ref'

Plug 'rking/ag.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/benchvimrc-vim'

Plug 'itchyny/lightline.vim'
call plug#end()

" ==== settings for plugin ===
let g:lightline = { 'colorscheme': 'wombat' }
let g:previm_open_cmd = 'open -a Google\ Chrome'

nnoremap ,uo :Unite -no-quit -vertical -winwidth=50 outline<CR>
nnoremap ,uoq :Unite -no-quit -vertical -winwidth=50 outline<CR>:q<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ug :<C-u>Unite ghq<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>


filetype plugin indent on
syntax enable
set nocompatible
set incsearch
set list
set listchars=tab:»_,trail:-
set laststatus=2

set expandtab 
set tabstop=4 sw=4 sts=4
set modeline

set clipboard+=unnamed
set pastetoggle=<F2>

nnoremap ,vr :edit $MYVIMRC<CR>
nnoremap Y y$
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR><Esc>
nnoremap Fn :echo expand("%:p")<CR>

let g:netrw_liststyle = 3
let g:netrw_altv = 1

command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)
