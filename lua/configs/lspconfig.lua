require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "vtsls","cssls", "gopls", "nil_ls", "rust_analyzer", "tailwindcss", "tsx", "typescriptreact", "emmit_ls", "omnisharp"}

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      procMacro = {
        enable = true,
      },
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
      }
    },
  },
})

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
