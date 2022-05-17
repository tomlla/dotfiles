call plug#begin()
 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

set clipboard&
set clipboard=unnamed
set clipboard+=unnamedplus


let g:coc_global_extensions = [
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-actions',
  \ 'coc-jedi',
  \ 'coc-tsserver',
  \]
Plug 'junegunn/fzf',  { 'do': { -> fzf#install() } }

Plug 'joshdick/onedark.vim'

call plug#end()

set nu

colorscheme onedark

nnoremap ,vr :e<space>~/.config/nvim/init.vim<enter>
nnoremap <space>i :w<enter>
nnoremap <space>q :q<enter>
nnoremap <C-p> :FZF<cr>
nnoremap ,uo :History<cr>
nnoremap ,ub :Buffer<cr>
nnoremap ,gl :Commits<cr>
nmap <ctrl>d <Plug>(coc-defination)
nnoremap <leader>d  :r!date<enter>



" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
