" htmlファイル中からクラス定義箇所(cssファイル)に飛ぶvimL
" https://stackoverflow.com/questions/12833189/jump-to-css-selector-in-a-css-file-from-the-html-file-in-vim-using-a-single-keys/12835224#12835224
function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction

nnoremap <F3> :call JumpToCSS()<CR>
