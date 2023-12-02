return {
    "David-Kunz/gen.nvim",
    opts = {
        display_mode = "split",
        show_prompt = "false",
        show_model = "true",
    },
    lazy = false,
    keys = {
        { "<leader>ac", "<cmd>Gen Chat<CR>",        desc = "Chat with LLM" },
        { "<leader>ar", "<cmd>Gen Review_Code<CR>", desc = "Review Code " },
    },
    -- config = function()
    --     require("gen").setup({})
    -- end
}
