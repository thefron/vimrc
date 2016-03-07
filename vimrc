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
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'jpo/vim-railscasts-theme'
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
Plugin 'chriskempson/base16-vim'
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

let g:gist_api_url = 'http://github.daumkakao.com/api/v3'


if has("gui")
  filetype off
endif

colorscheme base16-tomorrow
set background=dark
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
