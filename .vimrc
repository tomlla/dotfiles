" === vim options ===
set nocompatible
set incsearch
set list
set listchars=tab:»_,trail:-
set laststatus=2

set expandtab 
set tabstop=4 sw=4 sts=4
set modeline

"set formatoptions+=mM    "日本語の行の連結時には空白を入力しない。
"set ambiwidth=double     "□や○の文字があってもカーソル位置がずれないようにする。

set clipboard+=unnamed
set pastetoggle=<F2>


call plug#begin('~/.vim/plugged')
"--- color scheme ---
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/desertEx'

" --- syntax highlight ---
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'kana/vim-filetype-haskell', {'for': 'haskell'}
Plug 'digitaltoad/vim-jade', {'for': ['jade', 'pug']}
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}

" --- dev-support for specific language ---
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'kovisoft/slimv', {'for': 'lisp'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
" 'vim-scripts/IndentAnything'
"Plug 'felixge/vim-nodejs-errorformat', {'for': ['javascript', 'coffee']}
"Plug 'tyru/open-browser.vim', {'for': [ 'html', 'xml', 'markdown', 'mkd' , 'textile']}
"Plug 'fatih/vim-go', {'for': 'go'}
"Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja']}
"Plug 'davidhalter/jedi-vim', {'for' :['python']}
"Plug 'kevinw/pyflakes-vim', { 'for' :['python']}
"Plug 'nvie/vim-flake8', { 'for' :['python']}
"Plug 'vim-ruby/vim-ruby', {'for' :['ruby']}
"Plug 'bbatsov/rubocop', {'for' :['ruby']}
"Plug 'aharisu/vim_goshrepl', {'for' :['ruby']}
"Plug 'kchmck/vim-coffee-script', {'for' :['coffee']}

" === unite ware ===
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'sorah/unite-ghq'

if has('lua') && (v:version >= 704)
    Plug 'Shougo/neocomplete'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" others
Plug 'kannokanno/previm', { 'for': ['mkd','md','markdown']}
"Plug 'vim-voom/VOoM', { 'for': ['mkd','md','markdown']}

"Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'ujihisa/quickrun'
Plug 'vim-jp/vimdoc-ja'
"Plug 'thinca/vim-ref'

"Plug 'tpope/vim-fugitive'
"Plug 'cohama/agit.vim'

"Plug 'scrooloose/nerdcommenter'

Plug 'rking/ag.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/benchvimrc-vim'

"Plug  'majutsushi/tagbar'
"Plug 'vim-scripts/gtags.vim'
"Plug 'vim-scripts/taglist.vim'

Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme jellybeans

" ==== plugin settings ===
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:lightline = { 'colorscheme': 'wombat' }
let g:previm_open_cmd = 'open -a Google\ Chrome'
"let NERDSpaceDelims = 1 " コメントした後に挿入するスペースの数
"nmap <Leader>c <Plug>NERDCommenterToggle
"vmap <Leader>c <Plug>NERDCommenterToggle
nnoremap r :QuickRun<CR>
let g:quickrun_config={'*': {'split': ''}} "quickrunで横分割
if exists("g:quickrun_config")
    let g:quickrun_config = {}
endif
let g:quickrun_config['javascript'] = {
            \   'command': 'node',
            \   'eval': 1,
            \}
let g:quickrun_config['lisp'] = {
            \   'command': 'clisp',
            \   'eval': 1,
            \}
let g:quickrun_config['go'] = {
            \    'command': 'go',
            \    'exec': ['go run %s',]
            \}
let g:slimv_lisp='/usr/local/bin/sbcl'
if has('mac')
    " osx + iTermの場合
    let g:slimv_swank_cmd='!osascript -e "tell application \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
endif
nnoremap ,uo :Unite -no-quit -vertical -winwidth=50 outline<CR>
nnoremap ,uoq :Unite -no-quit -vertical -winwidth=50 outline<CR>:q<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ug :<C-u>Unite ghq<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
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
"let g:neocomplete#enable_auto_select = 1
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


" ==== my keymapping ===
cnoremap <C-a> <Home>
nnoremap qn :cnext<CR>
nnoremap qp :cprevious<CR>
nnoremap qo :copen<CR>
nnoremap j gj
nnoremap k gk
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <Space>j  :update<CR>
nnoremap ,vr :edit $MYVIMRC<CR>
nnoremap Y y$
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR><Esc>
nnoremap Fn :echo expand("%:p")<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

function! Vgrep(str)
    let key = a:str
    execute 'vimgrep /' . l:key .'/ % | cw'
endfunction
command! -nargs=+ Vg :call Vgrep(<f-args>)

command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)


filetype plugin indent on
syntax enable
