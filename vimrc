" http://mixandgo.com/blog/vim-config-for-rails-ninjas

autocmd!
set nocompatible
set noshowmode
set encoding=utf-8
nnoremap Q <nop>

" Reload editor when .vimrc is modified.
au BufWritePost .vimrc so $MYVIMRC

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'duggiefresh/vim-easydir'

Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'fatih/vim-go'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'

Plugin 'tmhedberg/matchit'
Plugin 'rorymckinley/vim-rubyhash'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

Plugin 'szw/vim-tags'
Plugin 'vim-ruby/vim-ruby'
Plugin 'danchoi/ri.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'wellle/targets.vim'
Plugin 'slim-template/vim-slim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jgdavey/vim-blockle.git'
Plugin 'vim-scripts/closetag.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'gregsexton/gitv'
Plugin 'gabrielelana/vim-markdown'
Plugin 'henrik/vim-indexed-search'
Plugin 'vim-scripts/LargeFile'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'avakhov/vim-yaml'
Plugin 'idanarye/vim-merginal'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'danro/rename.vim'
Plugin 'groenewege/vim-less'
Plugin 'elzr/vim-json'
Plugin 'tsaleh/vim-supertab'
Plugin 'tpope/vim-endwise'
Plugin 'rodjek/vim-puppet'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wellbredgrapefruit/tomdoc.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/neocomplete.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'suan/vim-instant-markdown'
Plugin 'joshdick/onedark.vim'

call vundle#end()

hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|bower_components|build|tmp|log|target|dist)|(\.(swp|ico|git|svn|hg))$',
      \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
      \ }

nnoremap <C-b> :CtrlPBuffer<cr>
" CtrlP Delete
call ctrlp_bdelete#init()
" CtrlP Funky
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_multi_buffers = 1

" Disable tag generation on file save
let g:vim_tags_auto_generate = 0

nnoremap <C-c> :bnext\|bdelete #<CR>

let g:netrw_liststyle = 0

" Don't map rubyhash keys
let g:rubyhash_map_keys = 0
" ruby path if you are using RVM
let g:ruby_path = system('rvm current')

let g:go_fmt_command = "goimports"

if has("gui")
  filetype off
endif

set ls=2

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set number
set ruler
syntax enable
syntax sync fromstart
set synmaxcol=1200

set nojoinspaces
set nostartofline

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start

" List chars
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

set colorcolumn=+1


" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
" Add the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin on
filetype indent on

" swp files are annoying. Let's hope vim doesn't crash
set nobackup
set nowritebackup
set noswapfile

" function s:setupWrapping()
"   set wrap
"   set wm=2
"   set textwidth=80
" endfunction
set textwidth=80

" Autocommands
au BufRead,BufNewFile {Gemfile,Capfile,Kirkfile,Rakefile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.rl set ft=ragel
au BufRead,BufNewFile *.txt call s:setupWrapping()

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Add .dust extension
au BufNewFile,BufRead *.dust set filetype=html
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.es6 set filetype=javascript

set vb

set wildignore+=*/tmp/*,*/log/*

let g:syntastic_javascript_checkers = ['standard']
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap <F8> :TagbarToggle<CR>

au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" This trigger takes advantage of the fact that the quickfix window can be
" " easily distinguished by its file-type, qf. The wincmd J command is
" " equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" " the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

colorscheme onedark
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'


" NERDTree
map <Leader>n :NERDTree<CR>

" Fix highlights
hi link TagbarSignature Text

" Autocloses go autocomplete scratch
" https://github.com/fatih/vim-go/issues/223#issuecomment-62619901
set completeopt=menu

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
