---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
  },
}

M.ai = {
  n = {
    -- NeoAI
    ["<leader>aa"] = { "<cmd>NeoAI<cr>", "NeoAI - Normal Mode" },
    ["<leader>ac"] = { "<cmd>NeoAIContext<cr>", "NeoAI - Context Mode" },
    ["<leader>ai"] = { "<cmd>NeoAIInject<cr>", "NeoAI - Inject Mode" },
    -- ChatGPT.nvim
    ["<leader>Cc"] = { "<cmd>ChatGPT<cr>", "ChatGPT - Normal Mode" },
    ["<leader>Ca"] = { "<cmd>ChatGPTActAs<cr>", "ChatGPT - Act As" },
    ["<leader>Ce"] = { "<cmd>ChatGPTEditWithInstructions<cr>", "ChatGPT - Edit With Instructions" },

    -- Noice
    ["<leader>nh"] = { "<cmd>Noice history<cr>", "Noice - History" },
    ["<leader>nl"] = { "<cmd>Noice last<cr>", "Noice - Last Message" },
    ["<leader>nd"] = { "<cmd>Noice dismiss<cr>", "Noice - Dismiss Current Messages" },
    ["<leader>ne"] = { "<cmd>Noice errors<cr>", "Noice - Errors" },
    ["<leader>ns"] = { "<cmd>Noice stats<cr>", "Noice - Stats" },
    ["<leader>nt"] = { "<cmd>Noice telescope<cr>", "Noice - Telescope" },
  },
}

-- which_key.mappings["C"] = {
--   name = "+ChatGPT",
--   c = { "<cmd>ChatGPT<cr>", "ChatGPT - Chat" },
--   a = { "<cmd>ChatGPTActAs<cr>", "ChatGPT - Act As" },
--   e = { "<cmd>ChatGPTEditWithInstructions<cr>", "ChatGPT - Edit With Instructions" },
-- }

-- LSP LINES
-- See https://git.sr.ht/~whynothugo/lsp_lines.nvim#usage
-- vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- Hover actions
-- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
-- Code action groups
-- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

-- more keybinds!

-- which_key.mappings["t"] = {
--   name = "+Terminal",
--   f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
--   v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
--   h = { "<cmd>2ToggleTerm size=12 direction=horizontal<cr>", "Split horizontal" },
-- }
-- which_key.mappings["z"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
--
-- which_key.mappings["C"] = {
--   name = "+ChatGPT",
--   c = { "<cmd>ChatGPT<cr>", "ChatGPT - Chat" },
--   a = { "<cmd>ChatGPTActAs<cr>", "ChatGPT - Act As" },
--   e = { "<cmd>ChatGPTEditWithInstructions<cr>", "ChatGPT - Edit With Instructions" },
-- }
--

return M
