set expandtab
set shiftround
set smartindent
set autoindent

se nu
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
syntax on

let s:tabwidth=4
exec 'set tabstop='     .s:tabwidth
exec 'set shiftwidth='  .s:tabwidth
exec 'set softtabstop=' .s:tabwidth
