" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" vim sensible
Plug 'https://github.com/tpope/vim-sensible.git'

" Extra C syntax
Plug 'https://github.com/justinmk/vim-syntax-extra.git'

" Desertink colortheme
Plug 'https://github.com/toupeira/vim-desertink.git'

" Prettier status bar
Plug 'https://github.com/vim-airline/vim-airline.git'

" Git gutter - shows git diff
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Vimagit
Plug 'https://github.com/jreybert/vimagit.git'

" fugitive - vim git wrapper
Plug 'https://github.com/tpope/vim-fugitive.git'

" YouCompleteMe - vim autocompletion
"Plug 'https://github.com/ycm-core/YouCompleteMe.git'

highlight GitGutterAdd    guifg=#009900 guibg=#000000 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=#000000 ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=#000000 ctermfg=1 ctermbg=0

" Initialize plugin system
call plug#end()

"CScope
"set cscopetag
"set cscopeverbose

if has('quickfix')
  set cscopequickfix=s-,d-,i-,t-
endif

cnoreabbrev csa cs add
cnoreabbrev csf cs find
cnoreabbrev csk cs kill
cnoreabbrev csr cs reset
cnoreabbrev css cs show
cnoreabbrev csh cs help

if (@% == "") || (match(expand('%:p'), $PWD) == 0)
	if filereadable("cscope.out")
		exe "cs add" 'cscope.out'
	endif
endif

"if filereadable("cscope.in.out")
"	cs add cscope.in.out
"endif
"if filereadable("cscope.po.out")
"	cs add cscope.po.out
"endif


colorscheme desertink
syntax on
set encoding=utf-8
set number
set updatetime=100

nmap <silent> <S-Up> :wincmd k<CR>
nmap <silent> <S-Down> :wincmd j<CR>
nmap <silent> <S-Left> :wincmd h<CR>
nmap <silent> <S-Right> :wincmd l<CR>
