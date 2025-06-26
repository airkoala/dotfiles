-- -- LSP related plugins
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim",  opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
}
