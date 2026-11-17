vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local Snacks = require("snacks")

Snacks.setup({
  picker = {
    sources = {
      files = {
        hidden = true,
        ignored = true,
        exclude = {
          "**/.git/*",
          "**/node_modules/*",
          "**/.DS_Store",
          "build/*",
          "dist/*"
        }
      },
      grep = {
        hidden = true,
        ignored = true,
        exclude = {
          "**/.git/*",
          "**/node_modules/*",
          "**/.DS_Store",
          "build/*",
          "dist/*"
        }

      }
    }
  }
})


local map = vim.keymap.set

map("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "[S]earch [F]iles" })
map("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "[S]earch [G]rep" })
