" Automatically install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
set completeopt=menu,menuone,noselect

" Set leader to comma
let mapleader=","

" Set to open tree
nnoremap <leader><space> <cmd>NERDTreeToggle<cr>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Set to open Vista Sidebar
nnoremap ;<space> <cmd>Vista!!<cr>

let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']



map <C-p> :Files<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline_solarized_bg='dark'
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

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

set background=dark
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable

" Navigate buffers like tabs (gt & gT)
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprevious<CR>

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
set updatetime=1000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Allow mouse input
set mouse=a

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Set termdebug
let g:termdebug_wide=1

" Experimental Treesitter Plugin
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = { "zig", "python", "c", "bash", "json" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
"   ignore_install = { "javascript" }, -- List of parsers to ignore installing
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     -- disable = { "c", "rust" },  -- list of language that will be disabled
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }

" EOF

" Specific Local config
if filereadable($HOME . "/.config/nvim/templates/general.vim.local")
  source ~/.config/nvim/templates/general.vim.local
endif
