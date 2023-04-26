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
    ["<leader>Aa"] = { "<cmd>NeoAI<cr>", "NeoAI - Normal Mode" },
    ["<leader>Ac"] = { "<cmd>NeoAIContext<cr>", "NeoAI - Context Mode" },
    ["<leader>Ai"] = { "<cmd>NeoAIInject<cr>", "NeoAI - Inject Mode" },
    -- ChatGPT.nvim
    ["<leader>Cc"] = { "<cmd>ChatGPT<cr>", "ChatGPT - Normal Mode" },
    ["<leader>Ca"] = { "<cmd>ChatGPTActAs<cr>", "ChatGPT - Act As" },
    ["<leader>Ce"] = { "<cmd>ChatGPTEditWithInstructions<cr>", "ChatGPT - Edit With Instructions" },
  },
}

M.Noice = {
  n = {
    -- Noice
    ["<leader>Nh"] = { "<cmd>Noice history<cr>", "Noice - History" },
    ["<leader>Nl"] = { "<cmd>Noice last<cr>", "Noice - Last Message" },
    ["<leader>Nd"] = { "<cmd>Noice dismiss<cr>", "Noice - Dismiss Current Messages" },
    ["<leader>Ne"] = { "<cmd>Noice errors<cr>", "Noice - Errors" },
    ["<leader>Ns"] = { "<cmd>Noice stats<cr>", "Noice - Stats" },
    ["<leader>Nt"] = { "<cmd>Noice telescope<cr>", "Noice - Telescope" },
  },
}

M.Trouble = {
  n = {
    -- Trouble
    ["<leader>Tr"] = { "<cmd>Trouble lsp_references<cr>", "Trouble - References" },
    ["<leader>Td"] = { "<cmd>Trouble lsp_definitions<cr>", "Trouble - Definitions" },
    ["<leader>Tg"] = { "<cmd>Trouble document_diagnostics<cr>", "Trouble - Diagnostics" },
    ["<leader>Tq"] = { "<cmd>Trouble quickfix<cr>", "Trouble - QuickFix" },
    ["<leader>Tl"] = { "<cmd>Trouble loclist<cr>", "Trouble - LocationList" },
    ["<leader>Tw"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble - Workspace Diagnostics" },
  },
}

M.LspLines = {
  n = {
    -- LSP LINES
    ["<leader>ll"] = { "<cmd>lua require('lsp_lines').toggle()<cr>", "LSP_LINES - Toggle" },
  },
}

-- more keybinds!

-- which_key.mappings["t"] = {
--    name = "+Terminal",
--   f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
--   v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
--   h = { "<cmd>2ToggleTerm size=12 direction=horizontal<cr>", "Split horizontal" },
-- }

return M
