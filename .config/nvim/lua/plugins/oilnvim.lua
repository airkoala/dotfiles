return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = {
        "permissions",
        "size",
        { "icon", add_padding = false },
      },
      keymaps = {
        ["<C-p>"] = { "actions.preview", opts = { split = "belowright" } },
      },
      view_options = {
        show_hidden = true,
      },

      -- for git status
      win_options = {
        signcolumn = "yes:2",
      },
    })

    vim.keymap.set("n", "-", function()
      oil.open(nil, {
        preview = { split = "belowright" }
      })
    end)
  end,
}
