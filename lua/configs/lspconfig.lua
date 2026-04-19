require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "vtsls","cssls", "gopls", "nil_ls", "rust_analyzer", "tailwindcss", "tsx", "emmit_ls"}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
