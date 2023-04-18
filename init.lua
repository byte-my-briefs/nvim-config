--------------------------------- PRE: NEOVIDE CONFIGURATION ----------------------------------------
------------------------------ Note: Only runs IFF in Neovide. --------------------------------------

if vim.g.neovide then
  require "custom.configs.neovide"
end

------------------------------------------- GENERAL -------------------------------------------------

vim.wo.relativenumber = true
vim.opt.wrap = true

vim.g.italic_comments = true
vim.g.italic_keywords = true
vim.g.italic_functions = false
vim.g.italic_variables = false

---------------------------------------- PLUGIN CONFIGS ---------------------------------------------

-- LSP LINES
-- See ttps://git.sr.ht/~whynothugo/lsp_lines.nvim#setup
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = {
    only_current_line = true,
  },
}

-- MINIMAP.vim
-- See https://github.com/wfxr/minimap.vim
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0
vim.g.minimap_width = 5
vim.g.minimap_highlight_search = 1
vim.g.minimap_background_processing = 0
-- NOTE: these will break Nvim if re-enabled.
-- Since "cmp" cannot be not found, a fatal error is raised.

--
-- TODO: dlelet this if not helpful
-- vim.g.copilot_assume_mapped = true

---------------------------------------- AUTO-COMMANDS ---------------------------------------------

-- EXAMPLE AUTO-COMMAND
-- Auto resize panes when resizing nvim window
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
