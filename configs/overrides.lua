local M = {}

----------------------------------- TREESITTER ------------------------------------

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- basics
    "bash",
    "c",
    "markdown",
    "markdown_inline",
    "regex",

    "python",
    "rust",
    "go",

    -- web dev
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "svelte",

    -- misc.
    "prisma",
    "dockerfile",
  },

  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },

  highlight = {
    enable = true,
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {}, -- table of colour name strings
  },
}

------------------------------------- MASON --------------------------------------

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",
    "black",
    "isort",
    "flake8",
    "mypy",

    -- rust
    "rust-analyzer",
    "codelldb",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettierd",
    "svelte-language-server",
    "tailwindcss-language-server",

    -- misc.
    "json-lsp",
    "jsonlint",
    "prisma-language-server",
    "eslint-lsp",
    "bash-language-server",
    "goimports",
  },
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

----------------------------------- NVIM_TREE -------------------------------------

M.nvimtree = {
  -- git support in nvimtree
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = false,
    icons = {
      git_placement = "after",
      show = {
        git = true,
        modified = true,
      },
    },
  },
}

return M
