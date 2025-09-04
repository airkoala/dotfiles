return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    filetypes = {

      typst = {
        template = 'image("$FILE_PATH"),',
      },

    }
  },
  keys = {
    { "<leader>p", function()
      if not require("img-clip").paste_image({ show_dir_path_in_prompt = true }) then
        vim.notify("") -- clear error
        vim.cmd.normal([["+p]])
      end
    end, desc = "Paste from system clipboard" },
  },
}
