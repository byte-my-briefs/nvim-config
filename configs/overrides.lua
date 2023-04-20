local M = {}

----------------------------------- TREESITTER ------------------------------------

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- web dev
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",

    -- favs
    "prisma",
    "rust",
    "python",
    "go",
    "dockerfile",
    "svelte",

    --misc.
    "bash",
    "c",
    "markdown",
    "markdown_inline",
    "regex",
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

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettierd",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",
    -- "jedi-language-server",
    "black",
    "isort",
    "flake8",
    "mypy",

    -- rust
    "rust-analyzer",
    "codelldb",

    -- custom
    "svelte-language-server",
    "tailwindcss-language-server",
    "prisma-language-server",
    "eslint-lsp",
    "bash-language-server",
    "goimports",
  },
}

----------------------------------- NVIM_TREE -------------------------------------

M.nvimtree = {
  -- git support in nvimtree
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
