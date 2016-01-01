" バッファ一覧
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
"" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" レジスタ一覧
"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
"nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
 " ブックマーク一覧
"nnoremap <silent> ,ub :<C-u>Unite bookmark<CR>
 " ブックマークディレクトリ　設定
"let g:unite_source_bookmark_directory =	'~/.vim/bookmark'
 " 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite-ghq
nnoremap <silent>,ug :<C-u>Unite ghq<CR>

nnoremap <space>r <Plug>(unite_restart)
