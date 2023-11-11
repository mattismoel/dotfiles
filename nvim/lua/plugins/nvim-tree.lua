return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {},
    config = function ()
        require("nvim-tree").setup()
    end,
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle", desc = "Toggle filetree" },
    },
}
