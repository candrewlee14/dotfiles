source $HOME/.config/nvim/templates/general.vim
source $HOME/.config/nvim/templates/treesitter.vim
source $HOME/.config/nvim/templates/lsp_keymap.vim

" Theme
set background=dark
colorscheme onedark

call plug#begin()
" LSP resources
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

set omnifunc=v:lua.vim.lsp.omnifunc

lua << EOF
vim.g.coq_settings = {
	auto_start = 'shut-up',
	['keymap.jump_to_mark'] = '',
    ['display.icons.mode'] = 'none',
    ['clients.third_party.enabled'] = false,
}


local nvim_lsp = require('lspconfig')
local coc = require "coq"
local lsp_installer = require("nvim-lsp-installer")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = attach_lsp 
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)

    -- (optional) Customize the options passed to the server
    -- local opts = {}
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    -- Without coq.nvim:
    -- server:setup(opts)

    -- With coq.nvim:
    server:setup(coq.lsp_ensure_capabilities{on_attach = on_attach})
end)
EOF

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Specific Local config
if filereadable($HOME . "/.config/nvim/coq_init.vim.local")
  source ~/.config/nvim/coq_init.vim.local
endif
