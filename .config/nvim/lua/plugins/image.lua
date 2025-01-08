if vim.env.TERMINAL == "kitty" then
  return {
    "3rd/image.nvim",
    opts = {},
  }
else
  return {}
end
