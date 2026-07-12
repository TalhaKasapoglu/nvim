require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>s", function ()
  require("conform").format {lsp_fallback = true}
end, { desc = "save and format file"})

local cmp = require "cmp"

cmp.setup({
  mapping = {
    -- Aşağı ok tuşuna basınca bir sonraki öneriye geçer
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Yukarı ok tuşuna basınca bir önceki öneriye geçer
    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    
    -- Seçimi onaylamak için Enter (CR) tuşunu kullanmak isterseniz:
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
