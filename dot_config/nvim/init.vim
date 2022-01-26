call plug#begin()
    source $HOME/.config/nvim/templates/general.vim
call plug#end()

"Theme
colorscheme gruvbox

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Specific Local config
if filereadable($HOME . "/.config/nvim/init.vim.local")
  source ~/.config/nvim/init.vim.local
endif
