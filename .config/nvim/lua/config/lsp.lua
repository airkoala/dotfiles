-- TODO: Refactor

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local bufnr = args.buf
    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
    nmap("<leader>ca", function()
      require("tiny-code-action").code_action({})
    end, "[C]ode [A]ction")
    nmap("<leader>cf", vim.lsp.buf.format, "[C]ode [F]ormat")

    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- See `:help K` for why this keymap
    nmap("KK", vim.lsp.buf.hover, "Hover Documentation")
    nmap("Kk", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
  end
})
