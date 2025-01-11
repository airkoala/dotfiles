local M = {
  "3rd/image.nvim",
  lazy = false,
  opts = {},
}

if vim.env.TERMINAL == "kitty" then
  return M
else
  return {}
end
