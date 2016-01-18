syn enable
colorscheme desert

nnoremap ,s :source %<cr>
nnoremap Y y$
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR>

nnoremap <F1> <Nop>
inoremap <F1> <Nop>

nnoremap <Space>j  :update<CR>
nnoremap <Space>q  :q<CR>

nnoremap <C-a>  ^
nnoremap <C-e>  $
nnoremap <c-n> gt
nnoremap <c-p> gT
nnoremap j gj
nnoremap k gk

nnoremap qn :cnext<CR>
nnoremap qp :cprevious<CR>
nnoremap qo :copen<CR>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-c>:

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-k> <esc>C

"範囲内検索
vnoremap z/ <ESC>/\%V

