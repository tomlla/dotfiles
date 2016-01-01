"neocomplete.vimの設定

"neocoplete start automatically
let g:neocomplete#enable_at_startup = 1

let g:neocomplete#auto_completion_start_length=2

"辞書ファイルからの補完
let g:neocomplete#dictionary#dictionaries=  { 
  \ 'default' : '~/.vim/dictionary/default.dict',
  \ 'c' : '~/.vim/dictionary/c.dict',
  \ 'cpp' : '~/.vim/dictionary/cpp.dict',
  \ 'php' : '~/.vim/dictionary/php.dict',
  \ 'tex' : '~/.vim/dictionary/tex.dict',
  \ 'haskell' : '~/.vim/dictionary/haskell.dict',
  \ 'html' : '~/.vim/dictionary/html.dict'
\}

" 大文字、小文字の区別をするかどうか1なら区別しない。
let g:neocomplete#enable_smart_case = 0
" 自動的に一番上の候補を選ぶ(この動作はAutoComplpopと似た動作になる)
let g:neocomplete#enable_auto_select = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Set manual completion length.
" neocomplete になってからこれを設定する必要があるか未確認
"let g:neocompletemanual_completion_start_length = 9 "旧
"g:neocomplete#manual_completion_start_length = 9

"補完ウィンドウの設定 :help completeopt
set completeopt=menuone

let g:neocomplete#keyword_patterns = {}
let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

if !exists('g:neocomplete#omni_patterns')
    let g:neocomplete#omni_patterns = {}
endif
let g:neocomplete#omni_patterns.go = '\h\w*\.\?'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java = '\%(\h\w*\|)\)\.\w*'

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
