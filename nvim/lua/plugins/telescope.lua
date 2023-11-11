return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>",  desc = "Grep files" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>",      desc = "Search buffers" },
    },
}
