---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

----------------------------------------- UI -------------------------------------------

M.ui = {
  theme = "chadracula",
  theme_toggle = { "chadracula", "chadracula" },
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
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "default", -- default/round/block/arrow (separators work only for "default"
    -- statusline theme; round and block will work for the minimal theme only)
  },

  tabufline = {
    lazyload = true,
  },

  -- changed_themes = {
  -- chadracula = {
  -- base_30 = {
  -- adust comment colors so they are visible with transparent bg
  -- grey = "",
  -- grey_fg = "",
  -- },
  -- },
  -- },
}

--------------------------------- LOAD PLUGINS & MAPPINGS -----------------------------------
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
