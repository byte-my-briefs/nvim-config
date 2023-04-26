---- Note: Mason, Treesitter, and Nvim-Tree are configured in './configs/overrides.lua'----
local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -------------------------------------- CORE ----------------------------------------
  {
    -- Note: This MUST come before lsp-config (See https://github.com/folke/neodev.nvim#-setup).
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        -- See https://github.com/rcarriga/nvim-dap-ui#configuration
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {}
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      -- See https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-gindent_blankline_char_highlight_list
      vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

      -- vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"

      require("indent_blankline").setup {
        -- See https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-gindent_blankline_char_highlight_list
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      }
    end,
  },

  ------------------------------------- DEBUGGING -----------------------------------------
  -- TODO: add adapters/configs for Python & JS
  -- See https://github.com/mfussenegger/nvim-dap
  -- See https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript-chrome
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("nvim-dap-virtual-text").setup {
        virt_text_win_col = 80,
        highlight_changed_variables = true,
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "folke/neodev.nvim",
    },
    config = function()
      require("dapui").setup {}
    end,
  },

  ---------------------------------------- RUST ------------------------------------------

  {
    "simrat39/rust-tools.nvim",
    -- event = "BufEnter *.rs",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local rt = require "rust-tools"
      rt.setup {
        server = {
          on_attach = function(_, bufnr)
            -- TODO: add below keybinds to WhichKey in './mappings.lua'
            --
            -- Hover actions
            vim.keymap.set("n", "<C-k>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<C-l>", rt.code_action_group.code_action_group, { buffer = bufnr })
            -- Inlay hints (for all buffers)
            rt.inlay_hints.enable()
          end,
        },
      }
    end,
  },

  ----------------------------------------- GO -------------------------------------------

  {
    -- See https://github.com/ray-x/go.nvim
    "ray-x/go.nvim",
    event = { "CmdlineEnter" },
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  --------------------------------- AI && AUTO-COMPLETE -----------------------------------

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
    config = true,
  },

  {
    "zbirenbaum/copilot-cmp",
    opts = {},
    config = function()
      -- This config option helps prevent suggestions from auto-inserting on new lines.
      -- See https://github.com/zbirenbaum/copilot-cmp
      local cmp = require "copilot_cmp"
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
      end
      cmp.setup {
        mapping = {
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              fallback()
            end
          end),
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      { "zbirenbaum/copilot-cmp" },
    },
    opts = {
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },

  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = {
      "ChatGPT",
      "ChatGPTActAs",
      "ChatGPTEditWithInstructions",
      "ChatGPTRun",
    },
    config = function()
      require("chatgpt").setup {
        {
          openai_params = {
            model = "gpt-3.5-turbo",
            max_tokens = 1200,
          },
        },
      }
    end,
  },

  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>as", desc = "NEO_AI - summarize text" },
      { "<leader>ag", desc = "NEO_AI - generate git message" },
    },
    config = function()
      require("neoai").setup {}
    end,
  },

  ------------------------------------------ MOTION -------------------------------------------

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- {
  --   "edluffy/specs.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("specs").setup {
  --       show_jumps = true,
  --       min_jump = 8,
  --       popup = {
  --         delay_ms = 0, -- delay before popup displays
  --         inc_ms = 10, -- time increments used for fade/resize effects
  --         blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
  --         width = 10,
  --         winhl = "PMenu",
  --         fader = require("specs").pulse_fader,
  --         resizer = require("specs").shrink_resizer,
  --       },
  --       ignore_filetypes = {},
  --       ignore_buftypes = {
  --         nofile = true,
  --       },
  --     }
  --   end,
  -- },

  -- {
  --   "echasnovski/mini.animate",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mini.animate").setup {
  --       cursor = {
  --         -- Animate for 200 milliseconds with linear easing
  --         timing = require("mini.animate").gen_timing.quadratic {
  --           duration = 200,
  --           unit = "total",
  --         },
  --         -- Animate with shortest line for any cursor move
  --         path = require("mini.animate").gen_path.line {
  --           predicate = function()
  --             return true
  --           end,
  --         },
  --       },
  --       scroll = { enable = false },
  --       open = { enable = false },
  --       close = { enable = false },
  --     }
  --   end,
  -- },

  ------------------------------------------ UI -------------------------------------------

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
      },
      presets = {
        -- See https://github.com/folke/noice.nvim#-installation
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      -- messages = {
      --   -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      --   -- This is a current Neovim limitation.
      --
      --   enabled = true, -- enables the Noice messages UI
      --   view = "mini", -- default view for messages
      --   view_error = "notify", -- view for errors
      --   view_warn = "notify", -- view for warnings
      --   view_history = "messages", -- view for :messages
      --   view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      -- },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup {
            background_colour = "#000000",
          }
        end,
      },
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup {
        floating_window = false, -- Show hint in a floating window, set to false for virtual text only mode
        noice = true, --  this is important; set to true if you using noice to render markdown.
        transparency = 50, -- disabled by default, allow floating win transparent value 1~100
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        },
      }
    end,
  },

  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   event = "VeryLazy", -- previously: 'BufEnter'
  --   config = function()
  --     require("lsp_lines").setup()
  --     -- TODO: test this keybind; not sure if it is working.
  --     vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
  --   end,
  -- },
  --
  {
    -- see './init.lua' for config options (since it is Vim native)
    "wfxr/minimap.vim",
    enabled = false,
    event = "BufEnter",
  },

  ------------------------------------------- MISC. ---------------------------------------------

  {
    "windwp/nvim-ts-autotag",
    event = "BufEnter",
    config = function()
      require("nvim-ts-autotag").setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufEnter",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  {
    "HiPhish/nvim-ts-rainbow2",
    event = "VeryLazy",
  },

  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command "augroup user_plugin_cursorword"
      vim.api.nvim_command "autocmd!"
      vim.api.nvim_command "autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0"
      vim.api.nvim_command "autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif"
      vim.api.nvim_command "autocmd InsertEnter * let b:cursorword = 0"
      vim.api.nvim_command "autocmd InsertLeave * let b:cursorword = 1"
      vim.api.nvim_command "augroup END"
    end,
  },
}

return plugins
