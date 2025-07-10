-- Set kitty background opacity to 100%
if vim.env.TERMINAL == "kitty" then
  os.execute("kitten @ set-background-opacity 1.0")
  vim.api.nvim_create_autocmd("VimLeavePre", {
    -- This callback is executed before neovim exits.
    callback = function()
      os.execute("kitten @ set-background-opacity $KITTY_OPACITY")
    end,
  })
end

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
