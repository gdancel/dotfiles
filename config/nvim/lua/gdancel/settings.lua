local g = vim.g
local o = vim.o

o.termguicolors = true
o.bg = 'dark'

-- tabs
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.expandtab = true
o.smarttab = true
o.autoindent = true

-- ruler
o.number = true
o.relativenumber = true
o.cursorline = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

o.clipboard = 'unnamedplus'

o.ignorecase = true
