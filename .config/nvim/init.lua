require('oracle.plugins')
require('oracle.settings')
require('oracle.keybinds')
-- require('pywal').setup()

-- Add colorscheme directory to runtimepath so colors/ files are found
-- vim.opt.rtp:append(vim.fn.stdpath("config") .. "/lua/oracle/colorscheme")

-- Set the colorscheme (this will load colors/compline.lua which calls setup)
-- vim.cmd("colorscheme compline")
