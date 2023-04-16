local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

------------------------------------- SERVER LIST -----------------------------------------

-- if you just want default config for the servers then put them in a table
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
-- for all available serveers/configurations.
-- NOTE: Any new LSPs MUST BE:
--                  (1) ADDED HERE,
--                  (2) AND added to the list of req'd Mason servers in './overrides.lua.'
local servers = {
  -- TODO: install PYTHON LSP (jedi or Pyright).
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "lua_ls",

  "prismals",
  "rust_analyzer",
  "svelte",
  "tailwindcss",
  "emmet_ls",
  "bashls",
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

-- NOTE: This shit FUCKS EVERYTHING UP!!!!!!!!!!! If you are having issues with LSPs/intellisense,
-- disable the below it; it will work without a doubt.
-- FUCK FUCK FUCK FUCK FUCK
-- A WHOLE DAY WASTED ON THIS SHIT.

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
      -- Do not send telemetry data containing a randomized but unique identifier
      -- telemetry = { enable = false },
      -- },
    },
  },
}

-- NOTE: do *NOT* add new setups like the below also re-passing
-- 'on_attach' and 'capabilities' (ass seen above)

-- lspconfig.tsserver.setup {}
-- lspconfig.prismals.setup {}
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ["rust-analyzer"] = {},
--   },
-- }
-- lspconfig.svelte.setup {}
-- lspconfig.tailwindcss.setup {}
-- lspconfig.emmet_ls.setup {}
-- lspconfig.bashls.setup {}
