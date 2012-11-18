color molokai
set guioptions-=T

" NERDTree
map <Leader>n :NERDTree<CR>
 
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  let g:CommandTMaxHeight=8
  map <D-t> :CommandT<CR>
  map <D-t>r :CommandTFlush<CR>
  CommandTFlush
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  set guioptions-=rL
endif

" My own flavor
color railscasts2
set transparency=0
set guifont=Monaco:h13

" Load local settings
if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif
