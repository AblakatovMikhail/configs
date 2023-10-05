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

highlight GitGutterAdd    guifg=#009900 guibg=#000000 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=#000000 ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=#000000 ctermfg=1 ctermbg=0

nmap ]h <PLug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Vimagit
Plug 'https://github.com/jreybert/vimagit.git'

" fugitive - vim git wrapper
Plug 'https://github.com/tpope/vim-fugitive.git'

" vim-go - adds Go language support for Vim
Plug 'https://github.com/fatih/vim-go.git'

autocmd FileType * let g:go_def_mapping_enabled = 0
autocmd FileType go let g:go_def_mapping_enabled = 1
autocmd FileType go nmap gc :GoCallers<CR>
autocmd FileType go nmap gy :GoDefType<CR>
autocmd FileType go nmap gr :GoReferrers<CR>

" Vim files for Low Level Virtual Machine (LLVM)
Plug 'https://github.com/rhysd/vim-llvm.git'

" Resize a vertical or horizontal split screen
Plug 'ahonn/resize.vim'

" Diff two separate blocks of text with :Linediff
Plug 'AndrewRadev/linediff.vim'

" List every accessible mark in a sidebar
Plug 'Yilin-Yang/vim-markbar'

nmap <Leader>m <Plug>ToggleMarkbar

" search for multiple files with gf and select from location-list
Plug 'numEricL/vim-gf-list'

Plug 'AblakatovMikhail/coc.nvim', {
  \'for':[
    \'zig','cmake','rust','java','json','haskell','ts','sh','cs','yaml','c',
    \'cpp','d','python','dart','javascript','vim','tex'],
  \'branch': 'release'}

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

func MapCocMaps()
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gD <Plug>(coc-declaration)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> gu <Plug>(coc-references-used)
  nmap <silent> gc :call CocAction('showIncomingCalls')<CR>
  nmap <silent> gC :call CocAction('showOutgoingCallsCalls')<CR>
endfunc

autocmd FileType cpp call MapCocMaps()

function InstallCocVimtex(info)
  if a:info.status == 'installed' || a:info.force
    let l:temptexfile=system('mktemp --suffix=.tex')
    execute(':tabnew '.expand(l:temptexfile))
    CocInstall coc-vimtex
    execute(':tabc')
  endif
endfunction

" VimTeX is a modern Vim and Neovim filetype and syntax plugin for LaTeX files.
Plug 'AblakatovMikhail/vimtex', {
	\'do': function('InstallCocVimtex')}
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

function InstallCocSnippets(info)
  if a:info.status == 'installed' || a:info.force
    let l:temptexfile=system('mktemp --suffix=.tex')
    execute(':tabnew '.expand(l:temptexfile))
    CocInstall coc-snippets
    execute(':tabc')
  endif
endfunction

Plug 'AblakatovMikhail/vim-snippets', {
	\'branch': 'fork',
	\'do': function('InstallCocSnippets')}

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
