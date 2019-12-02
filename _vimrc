" Kyle Reed
" kallanreed@outlook.com

" Set colors
colorscheme desertEx

" Set options
syntax on
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set nowrap
set hlsearch
set nobackup
set nowritebackup
set backupcopy=no
set backspace=2
set incsearch
set mouse=a
set mousehide
set selectmode=""
set ruler
set rulerformat=%P\ %l,%c%V,%o
set vb

" Set Font
if has("gui_running")
  if has("gui_win32")
"    set guifont=Consolas:h11:cANSI
"    set guifont=Miriam\ Fixed:h11:cANSI
    set guifont=Courier\ New:h11:cANSI
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_gtk2")
    set guifont=Inconsolata\ 12
  endif
endif

" Useful bindings
map <C-H> /\%>81v<CR>
map <F2> ?{<CR>v%zf
vmap <F3> zf
map <F4> ?#region<CR>V/#endregion<CR>zf
vmap <C-C> "+y
vmap <C-X> "+x
vmap <C-V> "+gP

" Use python for nice JSON formatting
com! FormatJson :%!python -m json.tool
