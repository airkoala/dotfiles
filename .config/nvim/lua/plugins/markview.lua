return {
  "OXY2DEV/markview.nvim",
  -- lazy = false,   -- Recommended
  ft = "markdown", -- If you decide to lazy-load anyway

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    require("markview").setup({})

    vim.keymap.set("n", "<leader>cv", "<cmd>Markview toggle<cr>",
      { noremap = true, silent = true, desc = "Toggle Mark[v]iew" })
  end
}
