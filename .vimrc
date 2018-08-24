" === vim options ===
set binary noeol
set nocompatible
set nu
set incsearch
set list
set listchars=tab:»_,trail:-
set laststatus=2
"set cursorcolumn
set nowrap

set expandtab 
set tabstop=4 sw=4 sts=4
set modeline
"set showcmd "normal modeでの押したキーを表示してくれるやつ。いらないけど

set formatoptions+=mM    "日本語の行の連結時には空白を入力しない。
set ambiwidth=double     "□や○の文字があってもカーソル位置がずれないようにする。

"set clipboard+=unnamed
set clipboard&
set clipboard^=unnamedplus
set pastetoggle=<F2>
set fdm=indent

set autoindent

set backup
set backupdir=~/var/vim/backup
set swapfile
set directory=~/var/vim/swap

if has("nvim")
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
end
"--- color scheme ---
Plug 'jdkanani/vim-material-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/desertEx'

" --- dev-support for specific language ---
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'kana/vim-filetype-haskell', {'for': 'haskell'}
Plug 'digitaltoad/vim-jade', {'for': ['jade', 'pug']}
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}
Plug 'leafgarland/typescript-vim', {'for':['typescript'] }

Plug 'mcasper/vim-infer-debugger'
" Plug 'justmao945/vim-clang'
" Plug 'Shougo/neoinclude.vim'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'kovisoft/slimv', {'for': 'lisp'}
Plug 'tpope/vim-classpath', { 'for': ['clojure','java']}
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
" 'vim-scripts/IndentAnything'
Plug 'felixge/vim-nodejs-errorformat', {'for': ['javascript', 'coffee']}
"Plug 'tyru/open-browser.vim', {'for': [ 'html', 'xml', 'markdown', 'mkd' , 'textile']}
"Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja']}
Plug 'davidhalter/jedi-vim', {'for' :['python']}
"Plug 'kevinw/pyflakes-vim', { 'for' :['python']}
"Plug 'nvie/vim-flake8', { 'for' :['python']}

Plug 'ngmy/vim-rubocop', {'for': ['ruby', 'erb', 'haml', 'slim']}
Plug 'osyo-manga/vim-monster', {'for': ['ruby', 'erb', 'haml', 'slim']}
let g:monster#completion#backend = 'solargraph'
let g:neocomplete#sources#omni#input_patterns = {
      \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
      \}
"Plug 'tpope/vim-haml', {'for' :['haml']}
Plug 'slim-template/vim-slim', { 'for': ['slim'] }
Plug 'tpope/vim-rails', {'for' :['ruby', 'haml', 'erb', 'slim']}
"Plug 'tpope/vim-bundler', {'for' :['ruby', 'haml', 'erb']} "ruby file開くと遅い
"Plug 'kchmck/vim-coffee-script', {'for' :['coffee']}
Plug 'posva/vim-vue', {'for': 'vue'}

" === general ===
"Plug 'scrooloose/syntastic', {'for': ['javascript', 'ruby']}
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'sorah/unite-ghq'

if has('nvim') || (has('lua') && (v:version >= 704))
    Plug 'Shougo/neocomplete'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" others
Plug 'kannokanno/previm', { 'for': ['mkd','md','markdown']}
"Plug 'vim-voom/VOoM', { 'for': ['mkd','md','markdown']}

Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim', {'for': ['html', 'xml', 'eruby']}
Plug 'ujihisa/quickrun'
Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-ref'

Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'

"Plug 'scrooloose/nerdcommenter'

Plug 'rking/ag.vim'
Plug 'vim-scripts/sudo.vim'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'JazzCore/ctrlp-cmatcher', { 'do': 'sh install.sh' }
"Plug 'nixprime/cpsm', { 'do': './install.sh > /tmp/x 2>&1' } "はやいけどびるどが面倒
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/benchvimrc-vim'

"Plug  'majutsushi/tagbar'
"Plug 'vim-scripts/gtags.vim'
"Plug 'vim-scripts/taglist.vim'

Plug 'itchyny/lightline.vim'
"Plug 'lambdalisue/vim-gista'
Plug 'mattn/gist-vim'
"Plug 'mattn/vim-soundcloud'
call plug#end()

highlight ALEWarning ctermbg=DarkMagenta
let g:ale_sign_error = '✗ '
let g:ale_sign_warning = '⚠ '
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format='[%linter%](%severity%) %code: %%s'
let g:ale_open_list = 1
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \}
"   'ruby': ['rubocop', 'reek']

"let g:syntastic_javascript_checkers=['eslint']

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers=['rubocop', 'mri']
" let g:syntastic_ruby_checkers=['rubocop']
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
" let g:syntastic_error_symbol='✗ '
" let g:syntastic_style_error_symbol = '✗ '
" let g:syntastic_warning_symbol = '⚠ '
" let g:syntastic_style_warning_symbol = '⚠ '


 set background=dark
"set background=light
"colorscheme solarized
colorscheme jellybeans

" ==== plugin settings ===

let g:debugger_array = [
            \['\.rb', '    binding.pry # rubocop:disable Lint/Debugger'],
            \['\.rake', 'require "pry"; binding.pry'],
            \['\.js$', 'debugger;'],
            \]
nmap <Leader>p :call AddDebugger("o")<cr>

let g:netrw_liststyle = 3
let g:netrw_altv = 1

let g:lightline = { 'colorscheme': 'wombat' }

if has('unix')
    let s:uname = system('uname')
    if s:uname == "Darwin\n"
        let s:os = "Darwin"
    elseif s:uname == "Linux\n"
        let s:os = "Linux"
    endif
endif

if s:os == 'Darwin'
    let g:previm_open_cmd = 'open -a Google\ Chrome'
elseif s:os == 'Linux'
    let g:previm_open_cmd = 'xdg-open -a Google\ Chrome'
endif

"let NERDSpaceDelims = 1 " コメントした後に挿入するスペースの数
"nmap <Leader>c <Plug>NERDCommenterToggle
"vmap <Leader>c <Plug>NERDCommenterToggle

" === quickrun ===
nnoremap r :QuickRun<CR>
"let g:quickrun_config={'*': {'split': ''}} "quickrunで横分割
let g:quickrun_config={}
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
let g:quickrun_config['rust'] = {
            \    'command': 'rust',
            \    'exec': ['rust-run %s',]
            \}

" === slimv ===
let g:slimv_lisp='/usr/local/bin/sbcl'
if has('mac')
    " osx + iTermの場合
    let g:slimv_swank_cmd='!osascript -e "tell application \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
endif

" use cpsm
"let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" use ctrlp-cmatcher
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" === neomru ===
let g:neomru#follow_links = 1
let g:neomru#file_mru_limit = 50

" === unite ===
nnoremap ,uo :Unite -no-quit -vertical -winwidth=50 outline<CR>
nnoremap ,uoq :Unite -no-quit -vertical -winwidth=50 outline<CR>:q<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ug :<C-u>Unite ghq<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <C-g>i :Gina<space>

" === neocomplete ===
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length=2
"let g:neocomplete#enable_auto_select = 1

let g:neocomplete#enable_smart_case = 0 " 大文字、小文字の区別をするかどうか1なら区別しない。
let g:neocomplete#sources#syntax#min_keyword_length = 2 " Set minimum syntax keyword length.

set completeopt=menuone "補完ウィンドウの設定 :help completeopt

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
"let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

"inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"

"=== neosnippet ===
let g:neosnippet#enable_snipmate_compatibility = 0
let g:neosnippet#snippets_directory = '~/.vim/plugged/neosnippet-snippets'
let g:neosnippet#snippets_directory = '~/.vim/mysnippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"if has('conceal')
"      set conceallevel=2 concealcursor=niv
"endif
"
"# fzf
nnoremap <C-p> :FZF<cr>

"=== git plugin ===
nnoremap <space>gd :Gdiff<CR>

"=rust==
set hidden
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let $RUST_SRC_PATH="$HOME/src/rustc/src"

"let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" ==== my keymapping ===
nnoremap <Up> <C-w>1-
nnoremap <Down> <C-w>1+
nnoremap <Left> <C-w>1>
nnoremap <Right> <C-w>1<
cnoremap <C-a> <Home>
nnoremap qn :cnext<CR>
nnoremap qp :cprevious<CR>
nnoremap qo :copen<CR>
nnoremap j gj
nnoremap k gk
nnoremap J gJ
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <space>i  :update<CR>
nnoremap <space>q  :quit<CR>
nnoremap <space><space>  :update<CR>:quit<cr>
nnoremap ,vr :edit $MYVIMRC<CR>
nnoremap Y y$
nnoremap <leader>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR><Esc>
nnoremap Fn :echo expand("%:p")<CR>
nnoremap <C-g><C-r> :LAg<space><C-r><C-w><space>
nnoremap <C-g><C-g> :LAg<space>
" nnoremap <F4> :SyntasticReset<cr>

nnoremap <F3> :set wrap!<cr>
nnoremap <F9> :ALEToggle<cr>

inoremap <C-b> binding.pry

vnoremap z/ <ESC>/\%V
function! Vgrep(str)
    let key = a:str
    execute 'vimgrep /' . l:key .'/ % | cw'
endfunction
command! -nargs=+ Vg :call Vgrep(<f-args>)

command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

filetype plugin indent on
syntax enable

" augroup rbsyntaxcheck
"   autocmd!
"   autocmd BufWrite *.rb w !ruby -sc
"   autocmd BufWrite *.rake w !ruby -sc
"   autocmd BufWrite *.ru w !ruby -sc
"   autocmd BufWrite *.ru w !ruby -sc
" augroup END

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

let s:localvimrc = expand("~/.local.vimrc")
if file_readable(s:localvimrc)
    execute 'source '.s:localvimrc
endif