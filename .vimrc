augroup MyAutoCmd
    " initializing
    " prevent from duplicate command definition at reloading
    autocmd!
augroup END

set nocompatible " Vi no-compatible mode

" NeoBundle settings

let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'

if !isdirectory(s:neobundle_root) || v:version < 702
    " If NeoBundle is not installed or the version of Vim is old,
    " NeoBundle does not install any plugin.
    let s:noplugin = 1
else
    if has('vim_starting')
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
    NeoBundle 'vim-jp/vimdoc-ja'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'mattn/webapi-vim'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'itchyny/lightline.vim'
    " NeoBundle 'thinca/vim-quickrun'
    " NeoBundle 'tyru/open-browser.vim'
    " NeoBundle 'Shougo/vimshell.vim'
    " NeoBundle 'editorconfig/editorconfig-vim'
    " NeoBundle 'vim-scripts/Align'
    " NeoBundle 'godlygeek/tabular'
    " NeoBundle 'vim-scripts/YankRing.vim'
    " NeoBundle 'thinca/vim-template'
    " NeoBundle 'mattn/gist-vim'
    " NeoBundle 'Shougo/neosnippet'
    " NeoBundle 'Shougo/neosnippet-snippets'
    " NeoBundle 'honza/vim-snippets'
    " NeoBundle 'aklt/plantuml-syntax'

    " basyura/TweetVim dependency
    " NeoBundle 'basyura/twibill.vim'
    " NeoBundle 'h1mesuke/unite-outline'
    " NeoBundle 'basyura/bitly.vim'
    " NeoBundle 'mattn/favstar-vim'

    " NeoBundle 'basyura/TweetVim'  " Twitter client
    " NeoBundle 'sudo.vim'
    " NeoBundle 'revolunet/sublimetext-markdown-preview'
    " NeoBundle 'kannokanno/previm'

    call neobundle#end()

    NeoBundleCheck
endif

" NeoBundleLazy
" HTML, CSS
NeoBundleLazy 'mattn/emmet-vim', { 'autoload' : {'filetypes' : ['html', 'css', 'eruby']}}

" jade
NeoBundleLazy 'digitaltoad/vim-pug', { 'autoload' : {'filetypes' : ['pug']}}

NeoBundleLazy 'mxw/vim-jsx', { 'autoload' : {'filetypes' : ['jsx']}}

NeoBundleLazy 'maksimr/vim-jsbeautify', { 'autoload' : {'filetypes' : ['html', 'css', 'javascript', 'eruby']}}
" JavaScript

" indentation and syntax support
NeoBundleLazy 'pangloss/vim-javascript', { 'autoload' : {'filetypes' : ['html', 'javascript', 'eruby']}}

" NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
" \  'autoload' : {'filetypes' : ['html', 'javascript']}}
" NeoBundleLazy 'jelera/vim-javascript-syntax', {
" \   'autoload' : {'filetypes' : ['html', 'javascript']}}

" JavaScript completion
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
" NeoBundleLazy 'kana/vim-filetype-haskell', {'autoload' : {'filetypes' : ['haskell']}}
" NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload' : {'filetypes' : ['haskell']}}
" NeoBundleLazy 'ujihisa/neco-ghc', {'autoload' : {'filetypes' : ['haskell']}}

" reStructuredText
NeoBundleLazy 'Rykka/riv.vim', {'autoload' : {'filetypes' : ['rst']}}

" Dockerfile
NeoBundleLazy 'ekalinin/Dockerfile.vim', {'autoload' : {'filetypes' : ['dockerfile']}}

" syntastic
" If you want to check json, install jsonlint
" npm install -g jsonlint
" If you want to check python, install pylint
" pip install pylint
" If you want to check JavaScript, install Closure Linter
" pip install closure-linter
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" JavaScript
" let g:syntastic_javascript_checkers = ['gjslint']
" let g:syntastic_javascript_gjslint_args = '--strict --disable 0110,0220'
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_args = ''
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
" dynamic prompt
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

" enable filetype plugin and indent
" you must call this command after the neobundle setting
filetype plugin indent on

colorscheme ron
syntax enable  " sytax highlight
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" encoding
" prevent misconversion at hateblo.vim
set fileencoding=UTF-8
set termencoding=UTF-8

" search
set ignorecase
set smartcase
set incsearch  " incremental search
set hlsearch  " highlight matched text

" auto escape '/' and '?'
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" edit
set shiftround
set infercase
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen  " open already opened buffer instead of opening the new buffer
set showmatch  " highlight corresponding parentheses
set matchtime=3  " highlight at 3 sec

set matchpairs& matchpairs+=<:>
set backspace=indent,eol,start

if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
    set clipboard& clipboard+=unnamedplus,unnamed
else
    " set clipboard& clipboard+=unnamed,autoselect
    set clipboard& clipboard+=unnamed
endif

set nowritebackup
set nobackup
set noswapfile

" display
set number
set wrap
set textwidth=0
set ruler

set t_vb=

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

if !has('gui_running')
  set t_Co=256
endif


" macro and key binding

" search the word on cursor at typing '*'
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

cnoremap vh vertical help

nnoremap ,uf :Unite file_mru
nnoremap ,ub :Unite buffer
nnoremap ,ul :Unite file
nnoremap ,ui :Unite bookmark
nnoremap ,ua :UniteBookmarkAdd

" start on insert mode
let g:unite_enable_start_insert = 1

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep search
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" grep search the word on cursor
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" recall the previous search result
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap j gj
nnoremap k gk

vnoremap v $h

nnoremap <Tab> %
vnoremap <Tab> %

" move between windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" change the window size
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" http://itchyny.hatenablog.com/entry/2016/02/02/210000
" scroll configuration
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")


" open QuickFix after command such as make, grep, etc
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" close buffer at typing "q" in QuickFix and Help
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" save as super user
cmap w!! w !sudo tee > /dev/null %

" vim-template

" replace special characters in template
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
