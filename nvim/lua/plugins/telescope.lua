return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live grep" },
    },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["qq"] = actions.close
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    opts = {
    },
    config = function()
      require("telescope.themes").get_dropdown {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({

            })
          }
        }
      }
      require("telescope").load_extension("ui-select")
      -- require("telescope").load_extension("harpoon")
    end,
  },
}
