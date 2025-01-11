return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    -- Creates a beautiful debugger UI
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      }
    },

    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          -- 'delve',
        },
      }
    },

    -- Add your own debuggers here
    "nvim-neotest/nvim-nio",
  },

  keys = {
    { "<F5>",      mode = "n", desc = "Debug: Start/Continue" },
    { "<F1>",      mode = "n", desc = "Debug: Step Into" },
    { "<F2>",      mode = "n", desc = "Debug: Step Over" },
    { "<F3>",      mode = "n", desc = "Debug: Step Out" },
    { "<leader>b", mode = "n", desc = "Debug: Toggle Breakpoint" },
    { "<leader>B", mode = "n", desc = "Debug: Set Breakpoint" },
    { "<F7>",      mode = "n", desc = "Debug: See last session result." },
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Breakpoint" })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
