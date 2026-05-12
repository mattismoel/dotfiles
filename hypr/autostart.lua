local autostart_cmds = { "waybar", "hyprpaper" }

hl.on("hyprland.start", function()
  local cmd = table.concat(autostart_cmds, " & ")
  hl.exec_cmd(cmd)
end)
