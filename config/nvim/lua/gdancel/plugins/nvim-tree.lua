local g = vim.g
local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  return
end

g.loaded = 1
g.loaded_netrwPlugin = 1

nvimtree.setup()
