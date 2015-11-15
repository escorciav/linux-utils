" Setup vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed ere
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'klen/python-mode'
Bundle 'ervandew/supertab'

" -- Useful settings --
filetype plugin indent on
syntax on

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
"" let mapleader = ","

" Maybe, it will gimme a bigger buffer for undo
set undolevels=700

" Viz settings
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set term=xterm-256color

" Indent and Tabs
set autoindent
set smartindent
set expandtab

" Moving of code blocks
" Go into visual mode (v), thenselect several lines of code here and
" press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Status line without Powerline
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
"\ [%l/%L\ (%p%%)

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" -- Python tools --
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 81
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%81v.*/
    autocmd FileType python set nowrap
    autocmd FileType python map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
    augroup END

"" Python-mode setup
let g:pymode = 1
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
let g:pymode_options_colorcolumn = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
" Support virtualenv
let g:pymode_virtualenv = 1
" Disable breakpoints plugin
let g:pymode_breakpoint = 0
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = ["pyflakes", "pep8"]
" Auto check on save
let g:pymode_lint_on_write = 1
" Rope
let g:pymode_rope = 0
" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 1
