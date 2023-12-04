-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      require("formatter.filetypes.lua").stylua,
    },

    python = {
      require("formatter.filetypes.python").black,
    },

    c = {
      require("formatter.filetypes.c").clangformat,
    },

    h = {
      require("formatter.filetypes.c").clangformat,
    },

    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },

    hpp = {
      require("formatter.filetypes.cpp").clangformat,
    },


    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.keymap.set('n', '<leader>F',':Format<CR>')
vim.keymap.set('n', '<leader>f',':FormatWrite<CR>')
