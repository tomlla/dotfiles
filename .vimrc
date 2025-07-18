" === vim options ===
set binary
set eol
set nocompatible
set nu
set incsearch
set conceallevel=0

"set listchars=tab:»_,trail:-
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"set list

set laststatus=2
"set cursorcolumn
set nowrap

set expandtab 
set tabstop=4 sw=4 sts=4
set modeline
"set showcmd 

set formatoptions+=mM  
set ambiwidth=double  
set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8,cp932

set clipboard&
set clipboard=unnamed
set clipboard+=unnamedplus

function! s:CopyToTmuxClipboard()
	call system('tmux load-buffer - ', getreg('"'))
	" echo 'tmux load-buffer- ' . getreg('"')
endfunction
autocmd TextYankPost * call s:CopyToTmuxClipboard()

set fdm=indent

set autoindent

set backup
set backupdir=~/.local/var/vim/backup
set swapfile
set directory=~/.local/var/vim/swap
set hlsearch
set eol

if has("nvim")
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
end
"--- color scheme ---
Plug 'jdkanani/vim-material-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/desertEx'
Plug 'dracula/vim'

" === dev-support for specific language ===

" --- Frontend Or JS/TS ---
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'leafgarland/typescript-vim', {'for':['typescript'] }
Plug 'wavded/vim-stylus', {'for': ['stylus', 'styl']}
Plug 'prettier/vim-prettier', { 'for': ['html', 'javascript']}
"Plug 'posva/vim-vue', {'for': 'vue'}
"Plug 'digitaltoad/vim-pug', {'for': ['pug', 'vue']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['css', 'scss', 'vue']}


" --- python ---
"Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja']}
Plug 'davidhalter/jedi-vim', {'for' :['python']}
" Plug 'kevinw/pyflakes-vim', { 'for' :['python']}
Plug 'nvie/vim-flake8', { 'for' :['python']}
" Plug 'digitaltoad/vim-jade', {'for': ['jade', 'pug']}

" --- ruby
Plug 'ngmy/vim-rubocop', {'for': ['ruby', 'erb', 'haml', 'slim']}
"Plug 'tpope/vim-haml', {'for' :['haml']}
"Plug 'slim-template/vim-slim', { 'for': ['slim'] }
Plug 'tpope/vim-rails', {'for' :['ruby', 'rake', 'haml', 'erb', 'slim']}
"Plug 'tpope/vim-bundler', {'for' :['ruby', 'haml', 'erb']} "ruby file開くと遅い
"
" --- Other languages ---
Plug 'justmao945/vim-clang', {'for': ['c', 'cpp'] }
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
"Plug 'tpope/vim-classpath', { 'for': ['clojure','java']}
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
"Plug 'derekwyatt/vim-scala', {'for': ['scala']}
"Plug 'keith/swift.vim', {'for': 'swift'}
"Plug 'kovisoft/slimv', {'for': 'lisp'}
"Plug 'kana/vim-filetype-haskell', {'for': 'haskell'}
"Plug 'cespare/vim-toml', {'for': 'toml' }
Plug 'ionide/Ionide-vim'

" === general ===
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'previm/previm'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'

Plug 'prabirshrestha/async.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'sorah/unite-ghq'
Plug 'mcasper/vim-infer-debugger' " Add debugge; or binding.pry

Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" === others ===
Plug 'tyru/open-browser.vim', {'for': [ 'html', 'xml', 'markdown', 'mkd' , 'textile']}
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim', {'for': ['html', 'xml', 'eruby', 'tsx', 'jsx', 'typescript']}
Plug 'alvan/vim-closetag', {'for': ['html']}
Plug 'ujihisa/quickrun'
" Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-ref'
" Plug 'thinca/vim-showtime'

Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'

Plug 'preservim/nerdcommenter'

Plug 'rking/ag.vim'
Plug 'vim-scripts/sudo.vim'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'JazzCore/ctrlp-cmatcher', { 'do': 'sh install.sh' }
"Plug 'nixprime/cpsm', { 'do': './install.sh > /tmp/x 2>&1' } "はやいけどびるどが面倒
Plug 'junegunn/fzf',  { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'mattn/benchvimrc-vim'

"Plug  'majutsushi/tagbar'
"Plug 'vim-scripts/gtags.vim'
"Plug 'vim-scripts/taglist.vim'

Plug 'itchyny/lightline.vim'
"Plug 'lambdalisue/vim-gista'
" Plug 'mattn/gist-vim'
"Plug 'mattn/vim-soundcloud'
call plug#end()


" === for wayland ===
nnoremap <C-y> :call system("wl-copy --trim-newline", @")<CR>

function! IssueNumber()
    " e.g.) fix_#2090_change_xx_to_yy or feature_2090_implement_z --> return 2010
    let l:current_branch = vimproc#system2('git symbolic-ref --short HEAD')
    let l:issue_num = split(current_branch, '_\|-')[1] " split by `_` or `-`
    return join(split(issue_num, "#"))
endfunction
nnoremap <leader>g :call setline('.', printf('[#%d]', IssueNumber()))<cr>A<space>

let g:vue_pre_processors = ['pug', 'scss']

highlight ALEWarning ctermbg=DarkMagenta
let g:ale_list_window_size = 4
let g:ale_sign_error = '✖ '
let g:ale_sign_warning = '⚠ '
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format='[%linter%](%severity%) %code: %%s'
let g:ale_open_list = 1
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'go': ['gopls'],
      \ 'python': ['flake8'],
      \}

let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'eslint'],
    \ }

nnoremap <leader>f :ALEFix<cr>
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>


"let g:syntastic_javascript_checkers=['eslint']

set statusline+=%#warningmsg#
set statusline+=%*


" set background=dark
" colorscheme jellybeans
" colorscheme desert
" colorscheme desertEx

set background=light
" colorscheme default
" colorscheme solarized
colorscheme PaperColor

" ==== plugin settings ===

" \ '\.rb': 'binding.pry # rubocop:disable Lint/Debugger',
let g:user_debugger_dictionary = {
    \ '\.rb': 'binding.irb',
    \ '\.py': 'import pdb; pdb.set_trace()',
    \ '\.rake': 'require "pry"; binding.pry',
    \ '\.js$': 'debugger;',
    \ '\.ts$': 'debugger;',
    \ '\.vue$': 'debugger;',
    \ }
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
    let g:previm_open_cmd = 'google-chrome'
endif

"let NERDSpaceDelims = 1 " コメントした後に挿入するスペースの数
nnoremap <leader>c <Plug>NERDCommenterToggle
vnoremap <leader>c <Plug>NERDCommenterToggle

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
let g:quickrun_config['sql'] = {
            \    'command': 'make',
            \    'exec': ['make docker.db.query.byfile.dev SQL_FILE=%s',]
            \}

" === slimv ===
let g:slimv_lisp='/usr/local/bin/sbcl'
if has('mac')
    " osx + iTermの場合
    let g:slimv_swank_cmd='!osascript -e "tell application \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
endif

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
nnoremap <C-g>i :GoImport<space>

" === neocomplete ===
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length=2
"let g:neocomplete#enable_auto_select = 1

let g:neocomplete#enable_smart_case = 0 " 大文字、小文字の区別をするかどうか1なら区別しない。
let g:neocomplete#sources#syntax#min_keyword_length = 2 " Set minimum syntax keyword length.

" set completeopt=menuone "補完ウィンドウの設定 :help completeopt

let g:neocomplete#keyword_patterns = {}
let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

"=== neosnippet ===
let g:neosnippet#enable_snipmate_compatibility = 0
let g:neosnippet#snippets_directory = '~/.vim/mysnippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" fdが必要
nnoremap <C-p> :FZF<cr>

"=== git plugin ===
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>s :Gina status<CR>
nnoremap <space>c :Gina commit<CR>
nnoremap <space>p :Gina push<CR>
nnoremap <space>f :Gina fetch<CR>

"=rust==
" let $RUST_SRC_PATH="$HOME/src/rustc/src"
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
nnoremap <space>w  :set wrap!<CR>
nnoremap <space>i  :update<CR>
nnoremap <space>q  :quit<CR>
nnoremap <space><space>  :update<CR>:quit<cr>
nnoremap ,vr :edit $MYVIMRC<CR>
nnoremap Y y$
nnoremap <space>d i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><CR><Esc>
nnoremap fp :echo expand("%:P")<CR>
"nnoremap FP :echo expand("%:P")<CR>
nnoremap <C-g><C-r> :Rg<space><C-r><C-w>
nnoremap <C-g><C-g> :Rg<space>

set pastetoggle=<F2>

nnoremap <F3> :set nonumber<cr>:syntax off<cr>
nnoremap <F4> :set number<cr>:syntax enable<cr>
nnoremap <leader>3 :set wrap!<cr>
nnoremap <F9> :ALEToggle<cr>

nnoremap <leader>d :.!date +"\%Y-\%m-\%d"<cr>A

nnoremap RM :!rm %<cr>:bdelete<cr>

vnoremap z/ <ESC>/\%V
function! Vgrep(str)
    let key = a:str
    execute 'vimgrep /' . l:key .'/ % | cw'
endfunction
command! -nargs=+ Vg :call Vgrep(<f-args>)

command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)
command! FullPath :echo expand("%:p")

filetype plugin indent on
syntax enable

autocmd FileType make set noexpandtab
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
endif
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->['clangd']},
"         \ 'whitelist': ['c', 'cpp'],
"         \ })
" endif

let g:lsp_diagnostics_enabled = 0
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim-lsp.log')

augroup VimGoSetup
    autocmd!
    autocmd FileType go nmap <leader>t  <Plug>(go-test)
    "autocmd FileType go nmap <leader>cv <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>i <Plug>(go-info)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
augroup END
set updatetime=100
let g:go_auto_type_info = 1

let s:localvimrc = expand("~/.local.vimrc")
if file_readable(s:localvimrc)
    execute 'source '.s:localvimrc
endif
