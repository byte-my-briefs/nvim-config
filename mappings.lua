---@type MappingsTable
local M = {}

----------------------------------- NvChad Overrides --------------------------------------
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

M.Harpoon = {
  n = {
    ["<leader>Ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon - Add File" },
    ["<leader>Hh"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
    ["<leader>Hn"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon - Next File" },
    ["<leader>Hp"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon - Previous File" },

    ["<leader>H1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon - File 1" },
    ["<leader>H2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon - File 2" },
    ["<leader>H3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon - File 3" },
    ["<leader>H4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon - File 4" },
  },
}

---------------------------------- Vim-Fugitive (Git) -------------------------------------
M.Fugitive = {
  n = {
    ["<leader>G"] = { "<cmd>Git<cr>", "Git Fugitive" },
  },
}

--------------------------------------- Undo Tree -----------------------------------------
M.UndoTree = {
  n = {
    ["<leader>U"] = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
  },
}

---------------------------------------- NeoAI --------------------------------------------
M.AI = {
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

----------------------------------------- Noice -------------------------------------------
M.Noice = {
  n = {
    ["<leader>Nh"] = { "<cmd>Noice history<cr>", "Noice - History" },
    ["<leader>Nl"] = { "<cmd>Noice last<cr>", "Noice - Last Message" },
    ["<leader>Nd"] = { "<cmd>Noice dismiss<cr>", "Noice - Dismiss Current Messages" },
    ["<leader>Ne"] = { "<cmd>Noice errors<cr>", "Noice - Errors" },
    ["<leader>Ns"] = { "<cmd>Noice stats<cr>", "Noice - Stats" },
    ["<leader>Nt"] = { "<cmd>Noice telescope<cr>", "Noice - Telescope" },
  },
}

------------------------------------- Trouble.nimv ----------------------------------------
M.Trouble = {
  n = {
    ["<leader>Tr"] = { "<cmd>Trouble lsp_references<cr>", "Trouble - References" },
    ["<leader>Td"] = { "<cmd>Trouble lsp_definitions<cr>", "Trouble - Definitions" },
    ["<leader>Tg"] = { "<cmd>Trouble document_diagnostics<cr>", "Trouble - Diagnostics" },
    ["<leader>Tq"] = { "<cmd>Trouble quickfix<cr>", "Trouble - QuickFix" },
    ["<leader>Tl"] = { "<cmd>Trouble loclist<cr>", "Trouble - LocationList" },
    ["<leader>Tw"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble - Workspace Diagnostics" },
  },
}

-------------------------------------- LSP LINES ------------------------------------------
M.LspLines = {
  n = {
    ["<leader>ll"] = { "<cmd>lua require('lsp_lines').toggle()<cr>", "LSP_LINES - Toggle" },
  },
}

----------------------------------- Persistence.nvim --------------------------------------
M.Persistence = {
  n = {
    -- restore the session for the current directory
    ["<leader>qs"] = {
      "<cmd>lua require('persistence').load()<cr>",
      "Persistence - Restore last session for current directory",
    },
    -- restore the last session
    ["<leader>ql"] = {
      "<cmd>lua require('persistence').load({ last = true })<cr>",
      "Persistence - Restore last session",
    },
    -- stop Persistence => session won't be saved on exit
    ["<leader>qd"] = { "<cmd>lua require('persistence').stop()<cr>", "Persistence - Stop Persistence" },
  },
}

----------------------------------- Refactoring.nvim --------------------------------------
M.Refactoring = {
  v = {
    -- Remaps for the refactoring operations currently offered by the plugin
    ["<leader>Re"] = {
      "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>",
      "Refactoring - Extract Function",
      opts = { noremap = true, silent = true, expr = false },
    },
    ["<leader>Rf"] = {
      "<Esc><cmd>lua require('refactoring').refactor('Extract Function to File')<cr>",
      "Refactoring - Extract Function to File",
      opts = { noremap = true, silent = true, expr = false },
    },
    ["<leader>Rv"] = {
      "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<cr>",
      "Refactoring - Extract Variable",
      opts = { noremap = true, silent = true, expr = false },
    },
    ["<leader>Ri"] = {
      "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
      "Refactoring - Inline Variable",
      opts = { noremap = true, silent = true, expr = false },
    },
  },
  n = {
    -- Extract block doesn't need visual mode
    ["<leader>Rbb"] = {
      "<cmd>lua require('refactoring').refactor('Extract Block')<cr>",
      "Refactoring - Extract Block",
      opts = { noremap = true, silent = true, expr = false },
    },
    ["<leader>Rbf"] = {
      "<cmd>lua require('refactoring').refactor('Extract Block to File')<cr>",
      "Refactoring - Extract Block To File",
      opts = { noremap = true, silent = true, expr = false },
    },
    -- Inline variable can also pick up the identifier currently under the cursor without visual mode
    ["<leader>Ri"] = {
      "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>",
      "Refactoring - Inline Variable",
      opts = { noremap = true, silent = true, expr = false },
    },
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
