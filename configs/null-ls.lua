-- SEE https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
-- SEE https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
-- SEE https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md

local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

----------------------------------- NULL_LS CONFIG ------------------------------------

local b = null_ls.builtins

local code_actions = null_ls.builtins.code_actions
local formatting = b.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completions

local sources = {
  formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  formatting.prettierd.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "scss",
      "json",
      "jsonc",
      "yaml",
      "svelte",
      "typescript",
      "javascript",
    },
  },
  formatting.stylua,
  formatting.clang_format,
  diagnostics.flake8,
  diagnostics.mypy,
  formatting.black,
  formatting.isort,
  formatting.rustfmt,
  formatting.prismaFmt,
  diagnostics.eslint_d,
  code_actions.eslint_d,
}

------------------ NULL_LS: PREVENT CONFLICTS WITH OTHER LANG-SERVERS -------------------
-- SEE: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts --
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end
--
-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

------------------------------------- INITIALIZE -------------------------------------------
null_ls.setup {
  debug = true,
  sources = sources,

  -- AUTO-SAVE (See https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting)
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        end,
      })
    end
  end,
}
