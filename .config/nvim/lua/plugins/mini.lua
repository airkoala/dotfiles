return {
  "echasnovski/mini.nvim",
  version = false,
  init = function()
    require("mini.icons").setup()
    require("mini.notify").setup({ lsp_progress = { enable = false } })
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.splitjoin").setup()
    require("mini.files").setup({
      windows = {
        preview = true,
        width_preview = 50,
      },
      mappings = {
        go_in = "<ENTER>",
        go_in_plus = "",
        go_out = "-",
        go_out_plus = "",
      },
    })

    -- Open mini.files at current file's directory with "-"
    vim.keymap.set("n", "-", function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end, { noremap = true, silent = true })
  end,
}
