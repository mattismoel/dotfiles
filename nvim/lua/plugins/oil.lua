return {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
        {"-", "<CMD>Oil<CR>", desc = "Open parent directory"}
    },
    opts = {
        float = {
            padding = 8,
            border = "rounded",
        },
    },
    config = function ()
       require("oil").setup()
    end
}
