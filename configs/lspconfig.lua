local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

------------------------------------- SERVER LIST -----------------------------------------

-- if you just want default config for the servers then put them in a table
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
-- for all available serveers/configurations.
-- Note: Any new LSPs MUST BE:
--            (1) ADDED HERE,
--            (2) AND added to the list of req'd Mason servers in './overrides.lua.'
local servers = {
  "lua_ls",

  "bashls",
  "clangd",
  "pyright",
  "tsserver",
  -- Note: Rust-analyzer is included, but is loaded automatically by Rust-tools, so do NOT turn this on.
  -- See https://github.com/simrat39/rust-tools.nvim#setup for more information.
  -- "rust_analyzer",

  "html",
  "cssls",
  "svelte",
  "tailwindcss",
  "emmet_ls",
  "eslint-lsp",
  "eslint_d",

  "prismals",
}

------------------------------------- SERVER SETUP -----------------------------------------

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

----------------------------------- SERVER OVERRIDES ---------------------------------------

-- lspconfig.pyright.setup { blabla }

-- Custom config for lua_ls; we need to pass several specific options.
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      -- runtime = { version = "LuaJIT" },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      semantics = {
        -- NOTE: Disable semantic highlighting as it is not currently working with lua_ls.
        -- See https://github.com/dracula/vim/issues/290#issuecomment-1417699846.
        enabled = false,
        keyword = false,
        variable = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      -- telemetry = { enable = false },
      -- },
    },
  },
}

-- NOTE: do *NOT* add new setups like the below UNLESS also re-passing
-- 'on_attach' and 'capabilities' (ass seen above); it will fuck everything up.
-- lspconfig.tsserver.setup {}
-- lspconfig.prismals.setup {}
-- lspconfig.svelte.setup {}
-- lspconfig.tailwindcss.setup {}
-- lspconfig.emmet_ls.setup {}
-- lspconfig.bashls.setup {}
