return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      opts.suggestion = opts.suggestion or {}
      opts.suggestion.keymap = opts.suggestion.keymap or {}
      -- Support <C-l> in addition to LazyVim's native <Tab> accept
      opts.suggestion.keymap.accept = "<C-l>"
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<C-l>"] = {
          LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
          "select_and_accept",
          "fallback",
        },
      },
    },
  },
}

