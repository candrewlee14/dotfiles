return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-/>",
        },
      },
      panel = { enabled = false },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      vim.keymap.set("i", "<C-]>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").next()
        end
      end, { desc = "[copilot] next suggestion" })
    end,
  },
}

