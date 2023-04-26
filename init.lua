--------------------------------- PRE: NEOVIDE CONFIGURATION ----------------------------------------
------------------------------ Note: Only runs IFF in Neovide. --------------------------------------

if vim.g.neovide then
  require "custom.configs.neovide"
end

------------------------------------------- GENERAL -------------------------------------------------

vim.wo.relativenumber = true
vim.opt.wrap = false

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
    -- only_current_line = true,
  },
}

-- MINIMAP.vim
-- See https://github.com/wfxr/minimap.vim
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0
vim.g.minimap_width = 5
vim.g.minimap_highlight_search = 1
vim.g.minimap_background_processing = 0

-- UNDO_TREE.vim
-- See https://github.com/mbbill/undotree.
vim.g.undotree_WindowLayout = 4

---------------------------------------- AUTO-COMMANDS ---------------------------------------------

-- EXAMPLE AUTO-COMMAND
-- Auto resize panes when resizing nvim window
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

-- Configure Go file formatting.
-- See https://github.com/ray-x/go.nvim.
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

-- NOTE: Disable semantic highlighting as it is not currently working with lua_ls.
-- See comments to https://www.reddit.com/r/neovim/comments/zjqquc/how_do_i_turn_off_semantic_tokens/.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
