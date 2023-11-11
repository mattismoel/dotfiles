return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Add file to harpoon" },
        { "<leader>hp", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle harpoon UI" },
    }
}
