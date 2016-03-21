let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>(neocomplete_start_auto_complete) =neocomplete#mappings#popup_post()
inoremap <silent> <Plug>(neocomplete_start_omni_complete) 
inoremap <silent> <expr> <Plug>(neocomplete_start_unite_quick_match) unite#sources#neocomplete#start_quick_match()
inoremap <silent> <expr> <Plug>(neocomplete_start_unite_complete) unite#sources#neocomplete#start_complete()
inoremap <silent> <expr> <Plug>(neosnippet_start_unite_snippet) unite#sources#neosnippet#start_complete()
inoremap <silent> <expr> <Plug>(neosnippet_jump) neosnippet#mappings#jump_impl()
inoremap <silent> <expr> <Plug>(neosnippet_expand) neosnippet#mappings#expand_impl()
inoremap <silent> <expr> <Plug>(neosnippet_jump_or_expand) neosnippet#mappings#jump_or_expand_impl()
inoremap <silent> <expr> <Plug>(neosnippet_expand_or_jump) neosnippet#mappings#expand_or_jump_impl()
inoremap <silent> <SNR>31_yrrecord =YRRecord3()
snoremap  a<BS>
smap <expr> 	 neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\	"
xnoremap 	 %
nnoremap 	 %
xmap  <Plug>(neosnippet_expand_target)
smap  <Plug>(neosnippet_expand_or_jump)
snoremap  a<BS>
nnoremap <silent>  :YRReplace '1', p
nnoremap <silent>  :YRReplace '-1', P
nnoremap # #zz
nnoremap * *zz
xnoremap <silent> * "vy/\V=substitute(escape(@v, '\/'), "\n", '\\n', 'g')
nmap @ :YRMapsMacro
nnoremap N Nzz
xnoremap <silent> P :YRPaste 'P', 'v'
nnoremap <silent> P :YRPaste 'P'
xmap S <Plug>VSurround
nmap T [toggle]
nnoremap <silent> [toggle]w :setl wrap!:setl wrap?
nnoremap <silent> [toggle]t :setl expandtab!:setl expandtab?
nnoremap <silent> [toggle]l :setl list!:setl list?
nnoremap <silent> [toggle]s :setl spell!:setl spell?
nnoremap [toggle] <Nop>
nmap \rwp <Plug>RestoreWinPosn
xmap \rwp <Plug>RestoreWinPosn
omap \rwp <Plug>RestoreWinPosn
nmap \swp <Plug>SaveWinPosn
xmap \swp <Plug>SaveWinPosn
omap \swp <Plug>SaveWinPosn
nmap \tt <Plug>AM_tt
xmap \tt <Plug>AM_tt
omap \tt <Plug>AM_tt
nmap \tsq <Plug>AM_tsq
xmap \tsq <Plug>AM_tsq
omap \tsq <Plug>AM_tsq
nmap \tsp <Plug>AM_tsp
xmap \tsp <Plug>AM_tsp
omap \tsp <Plug>AM_tsp
nmap \tml <Plug>AM_tml
xmap \tml <Plug>AM_tml
omap \tml <Plug>AM_tml
nmap \tab <Plug>AM_tab
xmap \tab <Plug>AM_tab
omap \tab <Plug>AM_tab
nmap \m= <Plug>AM_m=
xmap \m= <Plug>AM_m=
omap \m= <Plug>AM_m=
nmap \tW@ <Plug>AM_tW@
xmap \tW@ <Plug>AM_tW@
omap \tW@ <Plug>AM_tW@
nmap \t@ <Plug>AM_t@
xmap \t@ <Plug>AM_t@
omap \t@ <Plug>AM_t@
nmap \t~ <Plug>AM_t~
xmap \t~ <Plug>AM_t~
omap \t~ <Plug>AM_t~
nmap \t? <Plug>AM_t?
xmap \t? <Plug>AM_t?
omap \t? <Plug>AM_t?
nmap \w= <Plug>AM_w=
xmap \w= <Plug>AM_w=
omap \w= <Plug>AM_w=
nmap \ts= <Plug>AM_ts=
xmap \ts= <Plug>AM_ts=
omap \ts= <Plug>AM_ts=
nmap \ts< <Plug>AM_ts<
xmap \ts< <Plug>AM_ts<
omap \ts< <Plug>AM_ts<
nmap \ts; <Plug>AM_ts;
xmap \ts; <Plug>AM_ts;
omap \ts; <Plug>AM_ts;
nmap \ts: <Plug>AM_ts:
xmap \ts: <Plug>AM_ts:
omap \ts: <Plug>AM_ts:
nmap \ts, <Plug>AM_ts,
xmap \ts, <Plug>AM_ts,
omap \ts, <Plug>AM_ts,
nmap \t= <Plug>AM_t=
xmap \t= <Plug>AM_t=
omap \t= <Plug>AM_t=
nmap \t< <Plug>AM_t<
xmap \t< <Plug>AM_t<
omap \t< <Plug>AM_t<
nmap \t; <Plug>AM_t;
xmap \t; <Plug>AM_t;
omap \t; <Plug>AM_t;
nmap \t: <Plug>AM_t:
xmap \t: <Plug>AM_t:
omap \t: <Plug>AM_t:
nmap \t, <Plug>AM_t,
xmap \t, <Plug>AM_t,
omap \t, <Plug>AM_t,
nmap \t# <Plug>AM_t#
xmap \t# <Plug>AM_t#
omap \t# <Plug>AM_t#
map \t| <Plug>AM_t|
nmap \T~ <Plug>AM_T~
xmap \T~ <Plug>AM_T~
omap \T~ <Plug>AM_T~
nmap \Tsp <Plug>AM_Tsp
xmap \Tsp <Plug>AM_Tsp
omap \Tsp <Plug>AM_Tsp
nmap \Tab <Plug>AM_Tab
xmap \Tab <Plug>AM_Tab
omap \Tab <Plug>AM_Tab
nmap \TW@ <Plug>AM_TW@
xmap \TW@ <Plug>AM_TW@
omap \TW@ <Plug>AM_TW@
nmap \T@ <Plug>AM_T@
xmap \T@ <Plug>AM_T@
omap \T@ <Plug>AM_T@
nmap \T? <Plug>AM_T?
xmap \T? <Plug>AM_T?
omap \T? <Plug>AM_T?
nmap \T= <Plug>AM_T=
xmap \T= <Plug>AM_T=
omap \T= <Plug>AM_T=
nmap \T< <Plug>AM_T<
xmap \T< <Plug>AM_T<
omap \T< <Plug>AM_T<
nmap \T; <Plug>AM_T;
xmap \T; <Plug>AM_T;
omap \T; <Plug>AM_T;
nmap \T: <Plug>AM_T:
xmap \T: <Plug>AM_T:
omap \T: <Plug>AM_T:
nmap \Ts, <Plug>AM_Ts,
xmap \Ts, <Plug>AM_Ts,
omap \Ts, <Plug>AM_Ts,
nmap \T, <Plug>AM_T,o
xmap \T, <Plug>AM_T,o
omap \T, <Plug>AM_T,o
nmap \T# <Plug>AM_T#
xmap \T# <Plug>AM_T#
omap \T# <Plug>AM_T#
map \T| <Plug>AM_T|
nmap \Htd <Plug>AM_Htd
xmap \Htd <Plug>AM_Htd
omap \Htd <Plug>AM_Htd
nmap \anum <Plug>AM_aunum
xmap \anum <Plug>AM_aunum
omap \anum <Plug>AM_aunum
nmap \aenum <Plug>AM_aenum
xmap \aenum <Plug>AM_aenum
omap \aenum <Plug>AM_aenum
nmap \aunum <Plug>AM_aunum
xmap \aunum <Plug>AM_aunum
omap \aunum <Plug>AM_aunum
nmap \afnc <Plug>AM_afnc
xmap \afnc <Plug>AM_afnc
omap \afnc <Plug>AM_afnc
nmap \adef <Plug>AM_adef
xmap \adef <Plug>AM_adef
omap \adef <Plug>AM_adef
nmap \adec <Plug>AM_adec
xmap \adec <Plug>AM_adec
omap \adec <Plug>AM_adec
nmap \ascom <Plug>AM_ascom
xmap \ascom <Plug>AM_ascom
omap \ascom <Plug>AM_ascom
nmap \aocom <Plug>AM_aocom
xmap \aocom <Plug>AM_aocom
omap \aocom <Plug>AM_aocom
nmap \adcom <Plug>AM_adcom
xmap \adcom <Plug>AM_adcom
omap \adcom <Plug>AM_adcom
nmap \acom <Plug>AM_acom
xmap \acom <Plug>AM_acom
omap \acom <Plug>AM_acom
nmap \abox <Plug>AM_abox
xmap \abox <Plug>AM_abox
omap \abox <Plug>AM_abox
nmap \a( <Plug>AM_a(
xmap \a( <Plug>AM_a(
omap \a( <Plug>AM_a(
nmap \a= <Plug>AM_a=
xmap \a= <Plug>AM_a=
omap \a= <Plug>AM_a=
nmap \a< <Plug>AM_a<
xmap \a< <Plug>AM_a<
omap \a< <Plug>AM_a<
nmap \a, <Plug>AM_a,
xmap \a, <Plug>AM_a,
omap \a, <Plug>AM_a,
nmap \a? <Plug>AM_a?
xmap \a? <Plug>AM_a?
omap \a? <Plug>AM_a?
nmap \r <Plug>(quickrun)
xmap \r <Plug>(quickrun)
omap \r <Plug>(quickrun)
nmap cs <Plug>Csurround
xnoremap <silent> d :YRDeleteRange 'v'
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> gp :YRPaste 'gp'
nnoremap <silent> gP :YRPaste 'gP'
xmap gS <Plug>VgSurround
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap j gj
nnoremap k gk
nnoremap n nzz
xnoremap <silent> p :YRPaste 'p', 'v'
nnoremap <silent> p :YRPaste 'p'
xnoremap v $h " vを二回で行末まで選択
xnoremap <silent> x :YRDeleteRange 'v'
xnoremap <silent> y :YRYankRange 'v'
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
snoremap <Del> a<BS>
snoremap <BS> a<BS>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
nnoremap <silent> <Plug>(vimshell_create) :VimShellCreate
nnoremap <silent> <Plug>(vimshell_switch) :VimShell
xnoremap <silent> <Plug>(neosnippet_register_oneshot_snippet) :call neosnippet#mappings#_register_oneshot_snippet()
xnoremap <silent> <expr> <Plug>(neosnippet_start_unite_snippet_target) unite#sources#neosnippet_target#start()
xnoremap <silent> <Plug>(neosnippet_expand_target) :call neosnippet#mappings#_expand_target()
xnoremap <silent> <Plug>(neosnippet_get_selected_text) :call neosnippet#helpers#get_selected_text(visualmode(), 1)
snoremap <silent> <expr> <Plug>(neosnippet_jump) neosnippet#mappings#jump_impl()
snoremap <silent> <expr> <Plug>(neosnippet_expand) neosnippet#mappings#expand_impl()
snoremap <silent> <expr> <Plug>(neosnippet_jump_or_expand) neosnippet#mappings#jump_or_expand_impl()
snoremap <silent> <expr> <Plug>(neosnippet_expand_or_jump) neosnippet#mappings#expand_or_jump_impl()
xnoremap <silent> <Plug>(openbrowser-smart-search) :call openbrowser#_keymapping_smart_search('v')
nnoremap <silent> <Plug>(openbrowser-smart-search) :call openbrowser#_keymapping_smart_search('n')
xnoremap <silent> <Plug>(openbrowser-search) :call openbrowser#_keymapping_search('v')
nnoremap <silent> <Plug>(openbrowser-search) :call openbrowser#_keymapping_search('n')
xnoremap <silent> <Plug>(openbrowser-open) :call openbrowser#_keymapping_open('v')
nnoremap <silent> <Plug>(openbrowser-open) :call openbrowser#_keymapping_open('n')
nnoremap <silent> <SNR>31_yrrecord :call YRRecord3()
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
nmap <SNR>28_WE <Plug>AlignMapsWrapperEnd
nmap <SNR>28_WS <Plug>AlignMapsWrapperStart
xmap <SNR>28_WS <Plug>AlignMapsWrapperStart
omap <SNR>28_WS <Plug>AlignMapsWrapperStart
nnoremap <silent> <Plug>SurroundRepeat .
xnoremap <silent> <Plug>(quickrun) :QuickRun -mode v
nnoremap <silent> <Plug>(quickrun) :QuickRun -mode n
nnoremap <silent> <Plug>(quickrun-op) :set operatorfunc=quickrun#operatorg@
nnoremap <S-Down> +
nnoremap <S-Up> -
nnoremap <S-Right> >
nnoremap <S-Left> <
imap S <Plug>ISurround
imap s <Plug>Isurround
imap <expr> 	 neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\" : "\	"
imap  <Plug>(neosnippet_expand_or_jump)
imap  <Plug>Isurround
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
cnoremap vh vertical help
cmap w!! w !sudo tee > /dev/null %
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set clipboard=autoselect,exclude:cons\\|linux,unnamedplus,unnamed
set completefunc=neocomplete#complete#manual_complete
set completeopt=preview,menuone
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=ja
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set matchpairs=(:),{:},[:],<:>
set matchtime=3
set ruler
set runtimepath=~/.vim,~/.vim/bundle/vimproc/,~/.vim/bundle/vim-quickrun/,~/.vim/bundle/vim-surround/,~/.vim/bundle/Align/,~/.vim/bundle/YankRing.vim/,~/.vim/bundle/vim-template/,~/.vim/bundle/webapi-vim/,~/.vim/bundle/open-browser.vim/,~/.vim/bundle/gist-vim/,~/.vim/bundle/vimdoc-ja/,~/.vim/bundle/neosnippet/,~/.vim/bundle/neosnippet-snippets/,~/.vim/bundle/vim-snippets/,~/.vim/bundle/plantuml-syntax/,~/.vim/bundle/unite.vim/,~/.vim/bundle/neomru.vim/,~/.vim/bundle/vimshell.vim/,~/.vim/bundle/hateblo.vim/,~/.vim/bundle/vim-metarw/,~/.vim/bundle/neocomplete.vim/,~/.vim/bundle/.neobundle,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/neobundle.vim
set shiftround
set shiftwidth=4
set showmatch
set smartcase
set softtabstop=4
set noswapfile
set switchbuf=useopen
set tabstop=4
set termencoding=utf-8
set undodir=~/.vimundo
set undofile
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/vimscript/kics
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 ~/.vim/syntax/kics.vim
badd +0 ~/vimscript/s2/def-javascript.vim
badd +0 hello.kics
argglobal
silent! argdel *
argadd ~/.vim/syntax/kics.vim
set stal=2
edit ~/vimscript/s2/def-javascript.vim
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 75 + 75) / 151)
exe 'vert 2resize ' . ((&columns * 75 + 75) / 151)
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 91 - ((90 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
91
normal! 0
lcd ~/.vim/syntax
wincmd w
argglobal
edit ~/.vim/syntax/kics.vim
xnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
xnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
xnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
xnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
xnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
xnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=neocomplete#complete#auto_complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 15 - ((14 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 018|
lcd ~/.vim/syntax
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 75 + 75) / 151)
exe 'vert 2resize ' . ((&columns * 75 + 75) / 151)
tabedit ~/vimscript/kics/hello.kics
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=neocomplete#complete#auto_complete
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'kics'
setlocal filetype=kics
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal infercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'kics'
setlocal syntax=kics
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 9 - ((8 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 07|
lcd ~/.vim/syntax
2wincmd w
tabnext 1
set stal=1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
