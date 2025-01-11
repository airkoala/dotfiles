-- "gc" to comment visual regions/lines
return {
  "numToStr/Comment.nvim",
  event = "LspAttach",
  config = function()
    local comment = require("Comment")
    comment.setup({})

    -- Duplicate line and comment it
    vim.keymap.set("n", "gyc", "yy<Plug>(comment_toggle_linewise_current)p", {
      noremap = true,
      silent = true,
      desc = "Duplicate line and comment it",
    })
    -- Duplicate block and comment it
    vim.keymap.set("v", "gy", "Vygv<Plug>(comment_toggle_linewise_visual)'>p", { noremap = true, silent = true, desc = "Duplicate block and comment it" })
  end,
}
