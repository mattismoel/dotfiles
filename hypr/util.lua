---Checks if the input module is available.
---
---The require function for that module has to be called afterwards.
---@param module string Name of the module to require.
local function is_module_available(module)
  if package.loaded[module] then
    return true
  end

  for _, searcher in ipairs(package.searchers) do
    local loader = searcher(module)

    if type(loader) == "function" then
      return true
    end
  end

  return false
end

---Creates a compound command, i.e. "waybar & hyprpaper".
---@param cmds string[] The list of commands to concatenate.
---@return string command The concatenated compound command, i.e. "waybar & hyprpaper".
local create_concat_cmd = function(cmds)
  local cmd = table.concat(cmds, " & ")
  return cmd
end

return {
  is_module_available = is_module_available,
  create_concat_cmd = create_concat_cmd
}
