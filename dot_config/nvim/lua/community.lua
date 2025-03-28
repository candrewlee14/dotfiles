-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.test.neotest" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  {
    "kylechui/nvim-surround",
    opts = {
      keymaps = {
        normal = "<Leader>sa",
        normal_cur = false,
        normal_line = false,
        normal_cur_line = false,
        visual = "<Leader>s",
        visual_line = "<Leader>S",
        delete = "<Leader>sd",
        change = "<Leader>sr",
      },
      aliases = {
        ["i"] = "]", -- Index
        ["r"] = ")", -- Round
        ["b"] = "}", -- Brackets
      },
    },
  },
  { import = "astrocommunity.completion.copilot-lua" },
  { -- further customize the options set by the community
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     routes = {
  --       {
  --         filter = {
  --           event = "msg_show",
  --           any = {
  --             { find = "%d+L, %d+B" },
  --             { find = "; after #%d+" },
  --             { find = "; before #%d+" },
  --             { find = "%d fewer lines" },
  --             { find = "%d more lines" },
  --           },
  --         },
  --         opts = { skip = true },
  --       },
  --     },
  --   },
  -- },
}
