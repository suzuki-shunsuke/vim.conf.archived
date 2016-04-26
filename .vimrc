" 自動コマンド: ファイル読み書きやバッファを開いたりした際に実行されるコマンド
" 自動コマンドをグループにまとめる
" グループ単位で実行したり削除したり出来る
" 全ての自動コマンドを MyAutoCmd で定義する
augroup MyAutoCmd
    " 初期化
    " リロードした際に２重でコマンドが定義されないようにする
    autocmd!
augroup END

set nocompatible " Vi no-compatible mode

" NeoBundle settings

let s:noplugin = 0 " NeoBundle が使えるなら 0, そうでなければ 1
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'

if !isdirectory(s:neobundle_root) || v:version < 702
    " If NeoBundle is not installed or the version of Vim is old,
    " NeoBundle does not install any plugin.
    let s:noplugin = 1
else
    " vim_starting は VimEnter イベントが発生するまでは 1 で
    " それ以降 (VimEnter 発生中も含む) は 0
    " つまりこれをチェックすれば起動時のみ実行したい部分を切り分けられる。
    if has('vim_starting')
        " 起動時のみ実行したい処理
        " Add NeoBundle to 'runtimepath' and initialize it.
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#begin(expand('~/.vim/bundle/'))

    " Manage NeoBundle with itself.
    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle "Shougo/vimproc", {
    \ "build": {
    \   "windows" : "make -f make_mingw32.mak",
    \   "cygwin"  : "make -f make_cygwin.mak",
    \   "mac"     : "make -f make_mac.mak",
    \   "unix"    : "make -f make_unix.mak",
    \ }}
    NeoBundle 'vim-jp/vimdoc-ja'  " vim 日本語ヘルプ
    NeoBundle 'scrooloose/syntastic'  " 構文チェック
    NeoBundle 'Shougo/unite.vim'  " Unite and create user interfaces
    " NeoBundle 'thinca/vim-quickrun'  " 適切なプログラムを選択実行
    NeoBundle 'tpope/vim-surround'  " 通り囲んでいるものを操作
    NeoBundle 'mattn/webapi-vim'  " Web API のインタフェース
    " NeoBundle 'tyru/open-browser.vim'  " ブラウザで URI を開く
    NeoBundle 'Shougo/neomru.vim'  " MRU plugin includes unite.vim MRU sources
    NeoBundle 'itchyny/lightline.vim'
    " NeoBundle 'Shougo/vimshell.vim'  " Vim スクリプトで実装されたシェル
    " NeoBundle 'editorconfig/editorconfig-vim'
    " NeoBundle 'vim-scripts/Align'  " テキスト整形
    " NeoBundle 'godlygeek/tabular'  " テキストフィルタリングと整形
    " NeoBundle 'vim-scripts/YankRing.vim'  " ヤンクの履歴の保持、変更、削除
    " NeoBundle 'thinca/vim-template'  " テンプレートファイルの利用
    " NeoBundle 'mattn/gist-vim'  " Gist に投稿
    " NeoBundle 'Shougo/neosnippet'  " スニペットを用いた補完
    " NeoBundle 'Shougo/neosnippet-snippets'  " neosnippet の標準的なスニペットリポジトリ
    " NeoBundle 'honza/vim-snippets'  " スニペットリポジトリ
    " NeoBundle 'aklt/plantuml-syntax'  " PlantUML のシンタクスハイライト
    " NeoBundle 'basyura/twibill.vim'  " basyura/TweetVim が依存
    " NeoBundle 'h1mesuke/unite-outline'  " basyura/TweetVim が依存
    " NeoBundle 'basyura/bitly.vim'  " basyura/TweetVim が依存
    " NeoBundle 'mattn/favstar-vim'  " basyura/TweetVim が依存
    " NeoBundle 'basyura/TweetVim'  " Twitterクライアント
    " NeoBundle 'sudo.vim'
    " NeoBundle 'revolunet/sublimetext-markdown-preview'
    " NeoBundle 'kannokanno/previm'
    "
    call neobundle#end()

    NeoBundleCheck
endif

" NeoBundleLazy
" HTML, CSS
" 入力支援(スニペット)
NeoBundleLazy 'mattn/emmet-vim', { 'autoload' : {'filetypes' : ['html', 'css', 'eruby']}}

" コーディング規約にしたがってコード整形
NeoBundleLazy 'maksimr/vim-jsbeautify', { 'autoload' : {'filetypes' : ['html', 'css', 'javascript', 'eruby']}}
" JavaScript

" indentation and syntax support
NeoBundleLazy 'pangloss/vim-javascript', { 'autoload' : {'filetypes' : ['html', 'javascript', 'eruby']}}

" NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
" \  'autoload' : {'filetypes' : ['html', 'javascript']}}
" NeoBundleLazy 'jelera/vim-javascript-syntax', {
" \   'autoload' : {'filetypes' : ['html', 'javascript']}}

" JavaScriptの入力補完
NeoBundleLazy 'marijnh/tern_for_vim', {
\   'autoload' : {'filetypes' : ['html', 'javascript', 'eruby']},
\   'build' : { 'others' : 'npm install' }}

" TypeScript
au BufRead,BufNewFile *.ts set filetype=typescript
NeoBundleLazy 'leafgarland/typescript-vim', {
\   'autoload' : {'filetypes' : ['html', 'typescript']}}
NeoBundleLazy 'Quramy/tsuquyomi', {
\   'autoload' : {'filetypes' : ['html', 'typescript']}}


" Markdown
au BufRead,BufNewFile *.md set filetype=markdown
NeoBundleLazy 'superbrothers/vim-quickrun-markdown-gfm', {'autoload' : {'filetypes' : ['markdown']}}
NeoBundleLazy 'joker1007/vim-markdown-quote-syntax', {'autoload' : {'filetypes' : ['markdown']}}
NeoBundleLazy 'moznion/hateblo.vim', {'autoload' : {'filetypes' : ['markdown']}}
NeoBundleLazy 'kana/vim-metarw', {'autoload' : {'filetypes' : ['markdown']}}


" PlantUML
" NeoBundleLazy 'aklt/plantuml-syntax', {'autoload' : {'filetypes' : ['plantuml']}}

" Haskell
" NeoBundleLazy 'kana/vim-filetype-haskell', {'autoload' : {'filetypes' : ['haskell']}}  " Haskellのインデント
" NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload' : {'filetypes' : ['haskell']}}
" NeoBundleLazy 'ujihisa/neco-ghc', {'autoload' : {'filetypes' : ['haskell']}}

" reStructuredText
NeoBundleLazy 'Rykka/riv.vim', {'autoload' : {'filetypes' : ['rst']}}  " 入力支援

" Dockerfile
NeoBundleLazy 'ekalinin/Dockerfile.vim', {'autoload' : {'filetypes' : ['dockerfile']}}  " 入力支援

" syntastic
" jsonlintをインストールすればjsonの構文チェックができる
" npm install -g jsonlint
" pylintをインストールすればpythonの構文チェックができる
" pip install pylint
" Closure LinterをインストールすればJavaScriptの構文チェックができる
" pip install closure-linter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" JavaScript
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_javascript_gjslint_args = '--strict --disable 0110,0220'
" Python
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args = ''
let g:syntastic_python_pep8_args = "--ignore E501,E402"

" neocomplete
NeoBundleLazy 'Shougo/neocomplete.vim', {'autoload': {"insert": 1}}
" let g:neocomplete#enable_at_startup = 1
let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
    " let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    " Define dictionary.
    " let g:neocomplete#sources#dictionary#dictionaries = {
    "     \ 'default' : '',
    "     \ 'vimshell' : $HOME.'/.vimshell_hist',
    "     \ 'scheme' : $HOME.'/.gosh_completions'
    "         \ }
    " Enable heavy omni completion.
    " if !exists('g:neocomplete#sources#omni#input_patterns')
    "   let g:neocomplete#sources#omni#input_patterns = {}
    " endif

    " let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    " let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    " let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endfunction

function! s:hooks.on_post_source(bundle)
    NeoCompleteEnable

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
endfunction

" help completeopt
set completeopt=menuone

function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " For cursor moving in insert mode(Not recommended)
    " inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    " inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    " inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    " inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    " let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    " let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    " let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    " set completeopt+=longest
    " let g:neocomplete#enable_auto_select = 1
    " let g:neocomplete#disable_auto_complete = 1
endfunction

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"""""""""""""""""
" / neocomplete "
"""""""""""""""""

" VimShell
" 動的プロンプト
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '


" NeoBundleLazy 'sjl/gundo.vim', { 'autoload': {"commands": ["GundoToggle"]}}

" NeoBundleLazy 'vim-scripts/TaskList.vim', {
" \     'autoload': {"mappings": ['<Plug>TaskList']}}

" NeoBundleLazy 'thinca/vim-quickrun', {
"      \ 'autoload': {
"      \   'mappings': [['nxo', '<Plug>(quickrun)']]
"      \ }}
" nmap <Leader>r <Plug>(quickrun)
" let s:hooks = neobundle#get_hooks('vim-quickrun')
" function! s:hooks.on_source(bundle)
"       let g:quickrun_config = {
"       \ '*': {'runner': 'remote/vimproc'},
"       \ }
" endfunction

let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser',
\   },
\ }

" ファイルタイププラグインおよびインデントを有効化
" これはNeoBundleによる処理が終了したあとに呼ばなければならない
filetype plugin indent on

colorscheme ron
syntax enable     " 構文ハイライトを有効化
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する

" エンコード
" hateblo.vim でブログを投稿する際の文字化け防止
set fileencoding=UTF-8
set termencoding=UTF-8

" 検索関係
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" 編集関係
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start  " バックスペースでなんでも消せるようにする

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
    set clipboard& clipboard+=unnamedplus,unnamed
else
    " set clipboard& clipboard+=unnamed,autoselect
    set clipboard& clipboard+=unnamed
endif

set nowritebackup  " ファイルの上書きの前にバックアップを作らない
set nobackup       " 既存のファイルに(追加でなく)書き込む前にバックアップを生成しない
set noswapfile     " スワップファイルを作成せずに新しいバッファを開く

" 表示関係
set number       " 行番号の表示
set wrap         " 長いテキストの折り返し
set textwidth=0  " 自動的に改行が入るのを無効化
set ruler        " カーソルが何行目の何列目に置かれているか表示

set t_vb=  " エラー時に音もフラッシュも使わない

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

if !has('gui_running')
  set t_Co=256
endif


" マクロおよびキー設定

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" ヘルプを垂直に分割して開く
cnoremap vh vertical help

nnoremap ,uf :Unite file_mru
nnoremap ,ub :Unite buffer
nnoremap ,ul :Unite file
nnoremap ,ui :Unite bookmark
nnoremap ,ua :UniteBookmarkAdd

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

vnoremap v $h " vを二回で行末まで選択

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" http://itchyny.hatenablog.com/entry/2016/02/02/210000
" スクロールの設定
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")


" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" ファイル管理関係
" vim-templateによるテンプレートファイルの使用

" テンプレート中に含まれる特定文字列を置き換える
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction
" move the cursor to <+CURSOR+> included in the template.
autocmd MyAutoCmd User plugin-template-loaded
    \   if search('<+CURSOR+>')
    \ |   silent! execute 'normal! "_da>'
    \ | endif

" save the undo history.
set undodir=~/.vimundo
set undofile

" neosnippet Configuration
" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif
