call plug#begin()
 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-rust-analyzer
" :CocInstall coc-snippets

set clipboard&
set clipboard=unnamed
set clipboard^=unnamedplus

" Plug 'junegunn/fzf',  { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set nu

nnoremap ,vr :e<space>~/.config/nvim/init.vim<enter>
nnoremap <space>i :w<enter>
nnoremap <space>q :q<enter>
nnoremap <C-p> :FZF<cr>
nnoremap ,uo :History<cr>
nnoremap ,ub :Buffer<cr>
nnoremap ,gl :Commits<cr>
nmap <ctrl>d <Plug>(coc-defination)



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


imap <C-l> <Plug>(coc-snippets-expand)
