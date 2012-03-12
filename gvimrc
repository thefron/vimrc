color molokai
set guioptions-=T

" NERDTree
map <Leader>n :NERDTree<CR>
 
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  let g:CommandTMaxHeight=8
  map <D-t> :CommandT<CR>
  map <D-t>r :CommandTFlush<CR>
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
endif

" My own flavor
color railscasts2
set guioptions = aAce
set transparency=8
set guifont=Monaco:h12

" Load local settings
if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif
