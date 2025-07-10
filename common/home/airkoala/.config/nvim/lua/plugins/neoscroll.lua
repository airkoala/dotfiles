return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require("neoscroll")

    neoscroll.setup({
      easing_function = "quadratic",
    })

    local duration = 50

    local t = 50
    local two_t = duration * 2

    local s_opt = {
      move_cursor = true,
      duration = t,
      half_win_duration = t,
      easing = "quadratic",
    }

    local two_s_opt = s_opt
    two_s_opt.duration = two_s_opt.duration * 2

    local map = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    map["<C-u>"] = function()
      neoscroll.ctrl_u(s_opt)
    end
    map["<C-d>"] = function()
      neoscroll.ctrl_d(s_opt)
    end
    map["<C-b>"] = function()
      neoscroll.ctrl_b(two_s_opt)
    end
    map["<C-f>"] = function()
      neoscroll.ctrl_f(two_s_opt)
    end

    map["zt"] = function()
      neoscroll.zt(s_opt)
    end
    map["zz"] = function()
      neoscroll.zz(s_opt)
    end
    map["zb"] = function()
      neoscroll.zb(s_opt)
    end

    local modes = { "n", "v", "x" }
    for key, func in pairs(map) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
