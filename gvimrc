set guioptions-=T

" NERDTree
map <Leader>n :NERDTree<CR>

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  " macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  set guioptions-=rL
endif

" My own flavor
set transparency=0
set guifont=Monaco:h13
