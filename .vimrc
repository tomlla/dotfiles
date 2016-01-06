call plug#begin('~/.vim/plugged')

" ===== color scheme =====
Plug 'nanotech/jellybeans.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'vim-scripts/desertEx'
"Plug 'vim-scripts/newspaper.vim'
"Plug 'vim-scripts/candy.vim'
"Plug 'luckydev/150colors'

" === syntax highlight ===
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'kana/vim-filetype-haskell', {'for': 'haskell'}
Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}

" === plugins for specific language ===
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" 'vim-scripts/IndentAnything'
Plug 'felixge/vim-nodejs-errorformat', {'for': ['javascript', 'coffee']}
Plug 'tyru/open-browser.vim', {'for': [ 'html', 'xml', 'markdown', 'mkd' , 'textile']}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja']}
Plug 'davidhalter/jedi-vim', {'for' :['python']}
Plug 'kevinw/pyflakes-vim', { 'for' :['python']}
Plug 'nvie/vim-flake8', { 'for' :['python']}
"Plug 'vim-ruby/vim-ruby', {'for' :['ruby']}
"Plug 'bbatsov/rubocop', {'for' :['ruby']}
"Plug 'aharisu/vim_goshrepl', {'for' :['ruby']}
Plug 'kchmck/vim-coffee-script', {'for' :['coffee']}

" ===== for markdown =====
Plug 'plasticboy/vim-markdown', { 'for': ['mkd','md','markdown']}
Plug 'kannokanno/previm', { 'for': ['mkd','md','markdown']}
Plug 'vim-voom/VOoM', { 'for': ['mkd','md','markdown']}

" === Shougo ware ===
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/vimfiler'
" Plug 'Shougo/vimshell'
"
Plug 'sorah/unite-ghq'

" === others ====
Plug  'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'ujihisa/quickrun'

"'tpope/vim-classpath'
"'artur-shaik/vim-javacomplete2'

Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'mattn/benchvimrc-vim'  " :BenchVimrc を実行し%sort すると見やすい

Plug 'thinca/vim-ref'

"Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/taglist.vim'

Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'

Plug 'rking/ag.vim'
Plug 'vim-scripts/sudo.vim'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

"=============== Vim 自体のベーシックな設定 ===============

filetype plugin indent on
set expandtab 

set clipboard+=unnamed  "無名レジスタに入るデータが*レジスタにも入るようにする->他のアプリケーションでも使える
set mouse=a
set cindent
set autoindent 
set tabstop=4 sw=4 sts=4
"set tabpagemax=15
set showmatch
set incsearch
"status line関連
"set wildmenu
"set wrap
"set wildmode=list:longest 

"encording関係
if has('win32') || has('win64') || split(system('uname'),'_')[0] == 'MINGW32'
	set encoding=cp932
else
	set encoding=utf-8
endif

set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

set fdm=indent
set formatoptions+=mM 	"日本語の行の連結時には空白を入力しない。
set ambiwidth=double	 "□や○の文字があってもカーソル位置がずれないようにする。
set tags=tags,.tags,~/.tags
syntax enable
set nu
set pastetoggle=<F2>
set completeopt=menu,preview

set list
set listchars=tab:»_,trail:-

set modeline

"swapfile and backupfile settings
set backup
set backupdir=/tmp
set swapfile
set directory=/tmp

" ===== Key Mapping =====

nnoremap ,vr :edit $MYVIMRC<CR>
nnoremap Y y$
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR>

" F1を無効化
nnoremap <F1> <Nop>
inoremap <F1> <Nop>

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

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-k> <esc>C
nnoremap Fn :echo expand("%:p")<CR>

"範囲内検索
vnoremap z/ <ESC>/\%V

colorscheme jellybeans
highlight Normal ctermbg=none

"===== おれおれ関数/コマンド =====

" vimgrep
function! Vgrep(str)
    let key = a:str
    execute 'vimgrep /' . l:key .'/ % | cw'
endfunction
command! -nargs=+ Vg :call Vgrep(<f-args>)

" ファイル名変更 :Rename {newfilename}  !を付けると強制保存して変更
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

function! s:LoadSourceIfExist(path)
    let expandedPath = expand(a:path)
    if filereadable(expandedPath)
        exec 'source ' . expandedPath
    endif
endfunction

"=========== file, 言語ごとの設定===========
augroup MyAutoCommandGroup
    au BufRead,BufNewFile Makefile setfiletype make
    autocmd FileType javascript set ts=2 sw=2 
    autocmd FileType java setl shiftwidth=4 softtabstop=4 tabstop=4
    autocmd FileType php setl shiftwidth=4 softtabstop=4 tabstop=4
    "autocmd FileType python ~/.vim/after/ftplugin/python.vim で設定している
    autocmd FileType ruby setlocal ts=4 sw=4 sts=4 sta ai
    autocmd FileType html setlocal ai smartindent
    autocmd FileType htmljinja setlocal ai smartindent
    autocmd FileType smarty setlocal et ai
    autocmd FileType scheme setlocal autoindent
    autocmd FileType vim setlocal autoindent
    autocmd FileType go setlocal noexpandtab
    autocmd FileType c setlocal noexpandtab
    autocmd FileType cpp setlocal noexpandtab

    "for javascript
    au FileType javascript set ts=2 sw=2 
    au BufNewFile *.js set ft=javascript fenc=utf-8
augroup END

" ===== pluginや特定の機能の設定 =====

" > quickrun
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

" > kannokanno/previm
let g:previm_open_cmd = 'open -a Google\ Chrome'

" > unite.vim
call s:LoadSourceIfExist('~/.vim/myrc/unite.vimrc')
let g:ref_phpmanual_path = $HOME.'/doc/php-chunked-xhtml'
let g:ref_sqlitemanual_path = $HOME.'/doc/sqlite-doc'
nnoremap ,uo :Unite -no-quit -vertical -winwidth=50 outline<CR>
nnoremap ,uoq :Unite -no-quit -vertical -winwidth=50 outline<CR>:q<CR>

" > scrooloose/nerdcommenter
let NERDSpaceDelims = 1 " コメントした後に挿入するスペースの数
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" > vim-fugitive
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

" > jedi-vim
call s:LoadSourceIfExist('~/.vim/myrc/jedi-and-neocomplete.vimrc')

" === machine local vimrc ===

call s:LoadSourceIfExist('~/.local.vimrc')

" === TODO ===
"  * gocodeの設定 >> たぶんこれいらない
"     set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
"     Plug 'nsf/gocode'
"
"  * snipmate or neosnip
"
"  * tpope/vim-surround
"  * slimv
