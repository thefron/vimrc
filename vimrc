set nocompatible
set encoding=utf-8

if has("gui")
  " Setup pathogen
  filetype off
endif
call pathogen#runtime_append_all_bundles()

set number
set ruler
syntax on

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

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" swp files are annoying. Let's hope vim doesn't crash
set nobackup
set nowritebackup
set noswapfile

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

" Autocommands
au BufRead,BufNewFile {Gemfile,Capfile,Kirkfile,Rakefile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.rl set ft=ragel
au BufRead,BufNewFile *.txt call s:setupWrapping()

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" ZoomWin
map <Leader><Leader> :ZoomWin<CR>

" Add .dust extension
au BufNewFile,BufRead *.dust set filetype=html

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif
