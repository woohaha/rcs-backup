filetype plugin on
syntax on
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set number
set si
set expandtab
set tabstop=4
set sw=4
set shiftwidth=4
set showmatch
set incsearch
set t_Co=256
let g:BASH_AuthorName   = 'woohaha'
let g:BASH_Email        = 'realwoohaha@gmail.com'
let g:BASH_Company      = ''

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" The bundles you install will be listed here
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'python.vim--Vasiliev'
Bundle 'gg/python.vim'
Bundle 'taglist.vim'
Bundle 'mru.vim'
Bundle 'AutoClose'
Bundle 'corntrace/bufexplorer'
Bundle 'solarized'
Bundle 'bling/vim-airline'

"solarized theme setting
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

filetype plugin indent on

augroup vimrc_autocmds
	autocmd!
	" highlight characters past column 120
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%80v.*/
	autocmd FileType python set nowrap
augroup END

map <F2> :NERDTreeToggle<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1
"
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" " Auto check on save
let g:pymode_lint_write = 1
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
"
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Don't autofold code
let g:pymode_folding = 0

"Setting for tagslist
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

"Run Python(abandoned)
"autocmd BufRead,BufNewFile *.py map <F5> :% w !python3<CR>
"autocmd BufRead,BufNewFile *.py map <F6> :1, w !python3<CR>
"Run Bash Shell
"autocmd BufRead,BufNewFile *.sh map <F11> :% w !bash<CR> 

"Detect FileType to run proper interp"
autocmd FileType python map <F5> :% w !python3<CR>
autocmd FileType sh map <F5> :% w !$SHELL<CR>
autocmd FileType python map <F6> :1, w !python3<CR>
autocmd FileType sh map <F6> :1, w !$SHELL<CR>
autocmd FileType python map <C-F5> :% w !python<CR>
autocmd FileType sh map <C-F5> :% w !bash<CR>
autocmd FileType python map <C-F6> :1, w !python<CR>
autocmd FileType sh map <C-F6> :1, w !bash<CR>

"Auto Format"
map <F11> :call FormatSrc()<CR>

func FormatSrc()
    exec "w"
    if &filetype == 'py' || &filetype == 'python'
        exec "!autopep8 -i %"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none --lineend=linux %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none --lineend=linux %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "!astyle --style=gnu --one-line=keep-statements -a --suffix=none 2>/dev/null --lineend=linux %"
    elseif &filetype == 'c'
        exec "!astyle --style=gnu --one-line=keep-statements -a --suffix=none --lineend=linux %"
    endif
endfunc

"Auto Shebang"
autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\<nl>\"|$
autocmd BufNewFile *.lua 0put =\"#!/usr/bin/env lua\<nl>\"|$

"Powerline
set laststatus=2
"let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

"Airline"
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
