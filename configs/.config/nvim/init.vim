call plug#begin(stdpath('data') . '/plugged')
" color schema
Plug 'doums/darcula'

" neat status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'

" git integration
Plug 'tpope/vim-fugitive'

" file tree
Plug 'preservim/nerdtree'

" use neat font for icons
Plug 'ryanoasis/vim-devicons'

" fuzzy path/... finder
Plug 'ctrlpvim/ctrlp.vim'

" Conqueror of Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust lang
" Plug 'rust-lang/rust.vim'
call plug#end()


" 'vim-airline' config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" let g:airline#extensions#tmuxline#enabled = 1
" let g:airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"


" 'darcula' colorscheme
colorscheme darcula


" 'nerdtree' config
map <c-n> :NERDTreeToggle<CR>


" 'coc' config
" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction


" nvim-specific
set ttimeout
set ttimeoutlen=100

" allow unsaved background buffers and remember marks/undo for them
set hidden

" remember more history
set history=1000

" use spaces instead of tabs
set expandtab
" tab width
set tabstop=2
set shiftwidth=2
" make spaces indentation feel like tab
set softtabstop=2

" auto indentation
set autoindent

" always show status line
set laststatus=2
" always show tab line
set showtabline=2

" jump to open bracket when closing bracket inserted
set showmatch

" highlight search matches for incomplete pattern
set incsearch
set hlsearch
" make <CR> clear search highlighting
nnoremap <CR> :nohlsearch<CR><CR>
" make search case-sensitive only if pattern contains upper-case characters
set ignorecase smartcase

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=233
hi search cterm=NONE ctermfg=0 ctermbg=220

" set minimal amount of lines above and below the cursor
set scrolloff=4

" show command in vim command line
set showcmd

" automatically do language-dependent indenting
filetype plugin indent on

" automatically reload file if it was changed outside of vim
set autoread

" disable folding
set foldmethod=manual
set nofoldenable

set listchars=tab:»·,trail:·,extends:>,precedes:<
set list

" line numbers
set number

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" edit another file in the same directory as the current file
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" file search autocomplete
set wildmode=longest,full
set wildmenu

set backspace=indent,eol,start
set smarttab

" mouse support
" set ttymouse=xterm2
set mouse=a

" use system clipboard
set clipboard=unnamedplus

" use rg as grep
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
