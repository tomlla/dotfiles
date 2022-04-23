call plug#begin()
 
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'junegunn/fzf',  { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set nu

nnoremap ,vr :e<space>~/.config/nvim/init.vim<enter>
nnoremap <space>i :w<enter>
nnoremap <space>q :q<enter>
nnoremap <C-p> :FZF<cr>
nmap <ctrl>d <Plug>(coc-defination)
