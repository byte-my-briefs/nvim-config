---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

----------------------------------------- UI -------------------------------------------

M.ui = {
  -- also see: "chadtain", "doomchad", "doomchad", "everforest"
  theme = "doomchad",
  theme_toggle = { "doomchad", "everforest" },
  transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  telescope = {
    style = "bordered",
  },
  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    -- default/vscode/vscode_colored/minimal
    theme = "default",
    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "default",
    -- overriden_modules = nil,
  },
  tabufline = {
    lazyload = true,
    -- overriden_modules = nil,
  },
  changed_themes = {
    doomchad = {
      base_30 = {
        -- adust comment colors so they are visible with transparent bg
        grey = "",
        grey_fg = "",
      },
    },
  },
}

--------------------------------- LOAD PLUGINS & MAPPINGS -----------------------------------
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
