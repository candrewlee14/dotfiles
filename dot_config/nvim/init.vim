set nocompatible

call plug#begin()
Plug 'vim-test/vim-test'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'mhartington/oceanic-next'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'peitalin/vim-jsx-typescript'
Plug 'skywind3000/asyncrun.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

map <C-p> :Files<CR>

let g:asyncrun_open = 8
let g:asyncrun_status = ''

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:python3_host_prog = '~/.miniconda3/bin/python3'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline_solarized_bg='dark'
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" Set leader to comma
let mapleader=","
" Quick edit init.vim
nnoremap <Leader>v :n $MYVIMRC<cr>

" For vim-test: these Ctrl mappings work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "asyncrun"

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

command! -nargs=0 Prettier :CocCommand prettier.formatFile

set background=dark
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme gruvbox

" TextEdit might fail if hidden is not set.
set hidden
set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Navigate buffers like tabs (gt & gT)
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprevious<CR>

" Set termdebug
let g:termdebug_wide=1
