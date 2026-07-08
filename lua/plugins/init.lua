return {
  {
    "stevearc/conform.nvim",
    --event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" }

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "rust",
        "typescript",
        "javascript",
        "tsx",
        "jsx",
        "nix",
        "javascriptreact",
        "typescriptreact",
        "c_sharp",
      },
    },
    autotag = { enable = true },
  },
  {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    -- NvChad'in varsayılan cmp ayarlarını alıyoruz
    local conf = require "nvchad.configs.cmp"

    -- Tuş eşlemelerini (mappings) genişletiyoruz/değiştiriyoruz
    conf.mapping = cmp.mapping.preset.insert({
      -- Aşağı ok tuşu ile sonraki öğeye geçiş
      ["<Down>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Yukarı ok tuşu ile önceki öğeye geçiş
      ["<Up>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Seçimi onaylamak için Enter (CR) tuşu
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      
      -- İstersen Tab tuşunun işlevini tamamen kaldırabilir veya normal tab olarak bırakabilirsin
      -- ["<Tab>"] = cmp.config.disable, 
    })

    return conf
  end,
},

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "aca/emmet-ls",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "tsx" },
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required

      -- Only one of these is needed.
      "sindrets/diffview.nvim", -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
  },
}
