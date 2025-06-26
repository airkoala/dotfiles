return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    { "AndreM222/copilot-lualine" },
  },
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    server_opts_overrides = {
      settings = {
        telemetry = {
          telemetryLevel = "off",
        },
      },
    },
  },
}
