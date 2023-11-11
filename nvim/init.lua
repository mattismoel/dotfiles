require("defaults") -- Import default Neovim settings
require("keymaps")  -- Import keymaps
require("keymap")

-- Setup Lazy Nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


-- COLORSCHEME
vim.cmd.colorscheme "catppuccin" -- Use specific colorsheme

-- HIGHLIGHT ON YANK
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})


-- Mason and LSP-config --
require("mason").setup()
require("mason-lspconfig").setup()

-- Base server list
local servers = {
    gopls = {},
    tsserver = {},
    html = { filetypes = { "html" } },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            -- on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        -- LSP keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })  -- Go to definition
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover documentation" })     -- Hover docs
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Buffer rename" }) -- Rename symbol
        vim.keymap.set("n", "<leader>fd",
            function()                                                                                     -- Format document
                vim.lsp.buf.format { async = true }
            end, { buffer = ev.buf, desc = "Format document" })
    end,
})

vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "AutoFormat",
    callback = function ()
        vim.lsp.buf.format()
    end,
})
