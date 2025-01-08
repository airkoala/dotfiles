require("config.lazy")
require("config.keymap")
require("config.lsp")
require("config.kitty-integration")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- -- Disable the default vim.notify function when the message is about multiple
-- -- different client offset_encodings. This is a known issue with neovim
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
-- local notify = vim.notify
-- vim.notify = function(msg, ...)
--     if msg:match("warning: multiple different client offset_encodings") then
--         return
--     end
--
--     notify(msg, ...)
-- end
