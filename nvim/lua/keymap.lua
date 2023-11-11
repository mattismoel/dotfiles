vim.g.mapleader = " "
vim.g.maplocalleader = " "

local M = {}
function M.keymap(mode, keybinding, command, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, keybinding, command, options)
end

return M

