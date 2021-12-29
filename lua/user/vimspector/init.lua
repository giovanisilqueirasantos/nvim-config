vim.g.vimspector_base_dir = "/home/user/.config/nvim/lua/user/vimspector"

local status_ok, _ = pcall(require, "vimspector")
if not status_ok then
  return
end


