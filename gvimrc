set guioptions-=T

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  " macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  set guioptions-=rL
endif

" My own flavor
set transparency=0
set guifont=Roboto\ Mono\ Light\ for\ Powerline:h18
