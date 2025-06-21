-- adds git status column to oil.nvim
return {
  "refractalize/oil-git-status.nvim",
  dependencies = {
    "stevearc/oil.nvim",
  },
  config = function()
    local ogs = require("oil-git-status")
    local palette = require("gruvbox").palette

    ogs.setup({})

    for _, hl_group in pairs(ogs.highlight_groups) do
      -- gruvbox dark hard background
      vim.api.nvim_set_hl(0, hl_group.hl_group, { bg = palette.dark0_hard })

      if hl_group.index then
        -- index changes
        vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = palette.bright_blue })
      else
        -- working tree changes
        vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = palette.bright_yellow })
      end
    end
  end,
}
