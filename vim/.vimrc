" ==================================================================
" NATIVE CONFIG
" ==================================================================

" PANES
set fillchars+=vert:│
set splitbelow
set splitright
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" STATUS
set laststatus=2

" SEARCH
set incsearch

" LINES
set number                    " visible line numbering
set cursorline                " highlihgt current line
set scrolloff=5
set lazyredraw                " redraw only when we need to.
set showmatch                 " when on a [{(, highlight the matching )}]
set hlsearch                  " highlight search matches
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅  "display tabs and trailing spaces

" TABS
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set indentkeys+=O,o
set expandtab                   " Convert all TAB characters in the file to spaces

" DIRECTORY EXPLORER
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_list_hide = '^\./$,^\.\./$'
let g:netrw_hide = 1
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'

" COMMAND-LINE COMPLETION
set wildmenu
augroup configgroup             " an augroup ensures the autocmd's are only applied once
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 textwidth=79
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
augroup END

"Remap jk/kj to escape while in insert mode:
inoremap jk <esc>
inoremap kj <esc>


"Enable mouse highlighting
if has('mouse') | set mouse=a | endif

" PATTERN IGNORING
set wildignore+=*/.git/*,*/node_modules/*,*/build/*,*/.next/*,*/__snapshots__/*,*/flow-typed/*,*/priv/*,*/deps/*,package-lock.json,*.zip,*.png,*.jpg,*.gif,*.pdf,*DS_Store*
set grepprg=grep\ -In\ --exclude-dir={.git,node_modules,build,.next,__snapshots__,flow-typed,priv,deps}\ --exclude=package-lock.json

" SPELLCHECK
set spelllang=en
set complete+=kspell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile */blog/* setlocal spell
autocmd FileType gitcommit setlocal spell

" CLIPBOARD
set clipboard=unnamed

" HISTORY
set history=1000                " store lots of :cmdline history
set incsearch                   " search as characters are entered
set backspace=indent,eol,start  " Make backspace behave in a sane manner.
set undofile
set undodir=~/.vim/undo_files//
set directory=~/.vim/swap_files//
set backupdir=~/.vim/backup_files//

filetype on                     " Try to detect filetypes
filetype plugin indent on       " Enable file type detection and do language-dependent indenting.

" PERFORMANCE
set synmaxcol=200

" LEADER
let mapleader=" "
nnoremap <leader>! :!clear &&<SPACE>
nnoremap <leader>s :%s//g<LEFT><LEFT>
nnoremap <leader>e :e src/**/*
nnoremap <leader>g :silent grep -r '' src \| :redraw!<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap <leader>c :cfdo %s//g \| :w<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>


" ==================================================================
" PLUGIN MANAGEMENT
" ==================================================================

call plug#begin('~/.vim/plugged')

" COLOR SCHEME
Plug 'trevordmiller/nova-vim'

" EXTENDED LANGUAGES
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'

" EXTENDED % MATCHING
Plug 'tmhedberg/matchit'

" SNIPPETS
Plug 'KeyboardFire/vim-minisnip'

" INLINE LINTING/TYPE CHECKING/FORMATTING
Plug 'w0rp/ale'

" TIME TRACKING
Plug 'wakatime/vim-wakatime'

call plug#end()


" ==================================================================
" PLUGIN CONFIG
" ==================================================================

" COLOR SCHEME
colorscheme nova

" EXTENDED LANGUAGES
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" SNIPPETS
let g:minisnip_dir = '~/repos/dotfiles/files/.snippets/'
set dictionary=~/repos/dotfiles/files/.snippets/index.txt

" INLINE LINTING/TYPE CHECKING/FORMATTING
let g:ale_linters = {
\  'javascript': ['eslint', 'flow', 'prettier'],
\}
let g:ale_fixers = {
\  'javascript': ['eslint', 'prettier'],
\}
let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5'
let g:ale_fix_on_save = 1
