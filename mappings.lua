---@type MappingsTable
local M = {}

----------------------------------- NvCHAD OVERRIDES --------------------------------------
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

M.LspSaga = {
  n = {
    ["<leader>gh"] = { "<cmd>Lspsaga lsp_finder<cr>", "LSP Finder" }, -- Use <C-t> to jump back
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    ["<leader>gr"] = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
    ["<leader>gp"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" }, -- Use <C-t> to jump back
    ["<leader>gd"] = { "<cmd>Lspsaga goto_definition<cr>", "Go to definition" },
    ["<leader>gt"] = { "<cmd>Lspsaga goto_type_definition<cr>", "Go to type definition" },

    ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
    ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Show buffer diagnostics" },
    ["<leader>sw"] = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show workspace diagnostics" },
    ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show cursor diagnostics" },

    ["<leader>ci"] = { "Lspsaga incoming_calls", "Incoming calls" },
    ["<leader>co"] = { "Lspsaga outgoing_calls", "Outgoing calls" },

    ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous diagnostic" },
    ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next diagnostic" },

    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<cr>", "Outline" },
    ["<leader>tt"] = { "<cmd>Lspsaga term_toggle<cr>", "Toggle Floaterm" },
    ["<leader>rn"] = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
  },
  v = {
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
  },
  t = {
    ["<A-t"] = { "<cmd>Lspsaga term_toggle<cr>", "Toggle Floaterm" },
  },
}
-------------------------------------- ZEN MODE -------------------------------------------
M.Zen = {
  n = {
    ["<leader>Z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
  },
}
-------------------------------------- HARPOON --------------------------------------------
M.Harpoon = {
  n = {
    ["<leader>F"] = { "<cmd>Telescope harpoon marks <cr>", "Harpoon - Telescope" },

    ["<leader>Ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon - Add File" },
    ["<leader>HH"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
    ["<leader>Hn"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon - Next File" },
    ["<leader>Hp"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon - Previous File" },

    ["<leader>H1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon - File 1" },
    ["<leader>H2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon - File 2" },
    ["<leader>H3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon - File 3" },
    ["<leader>H4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon - File 4" },
    ["<leader>H5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon - File 5" },
    ["<leader>H6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon - File 6" },
  },
}

---------------------------------- VIM-FUGITIVE (Git) -------------------------------------
M.Fugitive = {
  n = {
    ["<leader>G"] = { "<cmd>Git<cr>", "Git Fugitive" },
  },
}

--------------------------------------- UNDO TREE -----------------------------------------
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

----------------------------------------- NOICE -------------------------------------------
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

M.TabufLine = {
  n = {
    ["<leader>tl"] = {
      "<cmd>lua require('nvchad_ui.tabufline').move_buf(-1)<cr>",
      "TabufLine - Move Tab Left (-1)",
      opts = { noremap = true, silent = true, expr = false },
    },
    ["<leader>tr"] = {
      "<cmd>lua require('nvchad_ui.tabufline').move_buf(1)<cr>",
      "TabufLine - Move Tab Right (1)",
      opts = { noremap = true, silent = true, expr = false },
    },
  },
}

-------------------------------------- MISC. ------------------------------------------
-- more keybinds!

-- which_key.mappings["t"] = {
--    name = "+Terminal",
--   f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
--   v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
--   h = { "<cmd>2ToggleTerm size=12 direction=horizontal<cr>", "Split horizontal" },
-- }

return M
