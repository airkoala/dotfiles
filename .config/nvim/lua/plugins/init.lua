return {
  -- Allow saving as sudo
  "lambdalisue/suda.vim",

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Useful plugin to show you pending keybinds.
  { "folke/which-key.nvim", opts = {} },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "norcalli/nvim-colorizer.lua",
    init = function()
      require("colorizer").setup()
    end,
  },

  {
    "Goose97/timber.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Syntax highlighting for kitty.conf
  { "fladson/vim-kitty", ft = "kitty" },
}
