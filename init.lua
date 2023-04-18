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
--
-- NOTE: Disable semantic highlighting as it is not currently working with lua_ls.
-- See comments to https://www.reddit.com/r/neovim/comments/zjqquc/how_do_i_turn_off_semantic_tokens/.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
