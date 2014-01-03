syntax on
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set nobackup
set number
set ruler
set backspace=indent,eol,start
set list
set listchars=tab:>.,extends:<,trail:_
set wrap
set clipboard+=unnamed
set clipboard=unnamed

colorscheme desert
highlight SpecialKey cterm=underline ctermfg=green ctermbg=blue

highlight JpSpace cterm=underline ctermfg=green ctermbg=blue
match JpSpace /　/

set textwidth=0
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent
set smarttab
set showcmd
let mapleader = ","

" keymap
nnoremap - <End>
nnoremap j gj
nnoremap k gk
" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up> <C-w>-
nnoremap <S-Down> <C-w>+

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-BS> <Del>

:map! <C-a> <Esc>^
:map  <C-a> <Esc>^
:map! <C-e> <Esc>$
:map  <C-e> <Esc>$

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
 autocmd! cch
 autocmd WinLeave * set nocursorline
 autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"Escの2回押しでハイライト消去
nmap <Esc><Esc> :noh<CR><Esc>

set nocompatible
filetype plugin indent off     " required!

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
" required! 
"NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'https://github.com/Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'https://github.com/Shougo/vimshell'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/neocomplcache'

" My Bundles here:
" original repos on github
NeoBundle 'https://github.com/tpope/vim-fugitive'
NeoBundle 'https://github.com/tpope/vim-rvm'
NeoBundle 'https://github.com/Lokaltog/vim-easymotion'
NeoBundle 'https://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'https://github.com/rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/tpope/vim-markdown.git'
NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'https://github.com/rking/ag.vim'
" vim-scripts repos
NeoBundle 'https://github.com/vim-scripts/Command-T.git'
NeoBundle 'https://github.com/vim-scripts/L9'
NeoBundle 'https://github.com/vim-scripts/FuzzyFinder'
NeoBundle 'https://github.com/vim-scripts/rails.vim'
NeoBundle 'https://github.com/vim-scripts/vcscommand.vim'
NeoBundle 'https://github.com/vim-scripts/dbext.vim'
NeoBundle 'https://github.com/vim-scripts/javacomplete'
NeoBundle 'https://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git'
NeoBundle 'https://github.com/vim-scripts/trinity.vim.git'
NeoBundle 'https://github.com/vim-scripts/taglist.vim.git'
NeoBundle 'https://github.com/vim-scripts/sudo.vim.git'
" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

filetype plugin indent on  " required!


" neocomplcache 設定
"起動時に有効
let g:neocomplcache_enable_at_startup = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20
"自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_auto_completion_start_length = 2
"手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 3
"バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 4
"シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 4
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
"入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1
"ポップアップメニューが出ているときに-を入力すると英数字で候補選択する。
"削除されていたようなのでコメントアウト
"let g:neocomplcache_enable_quick_match = 0
";で英数字候補選択できるようにしたかったけど動かない
"動かないのは仕様のようです。コメントアウト
"let g:neocomplcache_quick_match_patterns = {
"  \ 'default' : ';'
"  \ }
"大文字小文字を区切りとしたあいまい検索を行うかどうか。
"DTと入力するとD*T*と解釈され、DateTime等にマッチする。
let g:neocomplcache_enable_camel_case_completion = 0
"アンダーバーを区切りとしたあいまい検索を行うかどうか。
"m_sと入力するとm*_sと解釈され、mb_substr等にマッチする。
let g:neocomplcache_enable_underbar_completion = 0

"シンタックス補完を無効に
let g:neocomplcache_plugin_disable = {
\ 'syntax_complete' : 1,
\ }
"入力補完までのディレイ
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
"補完するためのキーワードパターンを指定
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
"日本語を補完候補として取得しないようにする
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"ファイルタイプの関連付け
if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif
"let g:neocomplcache_same_filetype_lists['ctp'] = 'php'
"let g:neocomplcache_same_filetype_lists['twig'] = 'html'

"ディクショナリ補完
"ファイルタイプごとの辞書ファイルの場所
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'vimshell' : $HOME . '/.vimshell/command-history'
\ }


"タグ補完
"タグファイルの場所
augroup SetTagsFile
autocmd!
autocmd FileType java setlocal tags=$HOME/.vim/tags/java.tags
autocmd FileType javascript setlocal tags=$HOME/.vim/tags/javascript.tags
autocmd FileType php setlocal tags=$HOME/.vim/tags/php.tags
autocmd FileType ruby setlocal tags=$HOME/.vim/tags/ruby.tags
augroup END
"タグ補完の呼び出しパターン
if !exists('g:neocomplcache_member_prefix_patterns')
  let g:neocomplcache_member_prefix_patterns = {}
endif
let g:neocomplcache_member_prefix_patterns['php'] = '->\|::'

"スニペット補完
"標準で用意されているスニペットを無効にする。初期化前に設定する
let g:neocomplcache_snippets_disable_runtime_snippets = 1
"スニペットファイルの置き場所
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

"オムニ補完
augroup SetOmniCompletionSetting
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType java setlocal omnifunc=javacomplete#Complete
"  autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END
 
"オムニ補完のパターンを設定
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns['twig']= '<[^>]*'
"let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


"改行で補完ウィンドウを閉じる
inoremap <expr><CR> pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"C-yで補完候補の確定
inoremap <expr><C-y> neocomplcache#close_popup()
"C-eで補完のキャンセルし、ウィンドウを閉じる。ポップアップが開いていないときはEndキー
inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
"C-gで補完を元に戻す
inoremap <expr><C-g> neocomplcache#undo_completion()
"vim標準のキーワード補完を置き換える
inoremap <expr><C-n> neocomplcache#manual_keyword_complete()
"補完候補の共通文字列を補完する(シェル補完のような動作)
"inoremap <expr><C-l> neocomplcache#complete_common_string()
"スニペットを展開する。スニペットが関係しないところでは行末まで削除
"imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"オムニ補完の手動呼び出し
inoremap <expr><C-Space> neocomplcache#manual_omni_complete()
"スニペットファイルを編集する
nnoremap <Space>nes :NeoComplCacheEditSnippets

" NERDTreeを開く
nnoremap <silent>nt :<C-u>NERDTree<CR>

" タブの制御
nnoremap [TABCMD]  <nop>
nmap     <Space>t [TABCMD]

nnoremap <silent> [TABCMD]f :<C-u>tabfirst<CR>
nnoremap <silent> [TABCMD]l :<C-u>tablast<CR>
nnoremap <silent> [TABCMD]n :<C-u>tabnext<CR>
nnoremap <silent> [TABCMD]N :<C-u>tabNext<CR>
nnoremap <silent> [TABCMD]p :<C-u>tabprevious<CR>
nnoremap <silent> [TABCMD]e :<C-u>tabedit<CR>
nnoremap <silent> [TABCMD]c :<C-u>tabclose<CR>
nnoremap <silent> [TABCMD]o :<C-u>tabonly<CR>
nnoremap <silent> [TABCMD]s :<C-u>tabs<CR>

" Unite設定
let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically=1
let g:unite_enable_ignore_case=1
let g:unite_winwidth=40

" バッファー
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイル
noremap <C-U><C-R> :Unite buffer file_mru<CR><Esc>
" レジスタ（ヤンク）一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR><Esc>
" 全部
noremap <C-U><C-A> :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Nerd_Commenter の基本設定
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>_ <Plug>NERDCommenterToggle
vmap <Leader>_ <Plug>NERDCommenterToggle
vmap <Leader>_s <Plug>NERDCommenterSexy
