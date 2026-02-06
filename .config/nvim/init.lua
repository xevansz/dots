require('zen.plugins')
require('zen.settings')
require('zen.keybinds')
-- require('pywal').setup()

-- Add colorscheme directory to runtimepath so colors/ files are found
-- vim.opt.rtp:append(vim.fn.stdpath("config") .. "/lua/zen/colorscheme")

-- Set the colorscheme (this will load colors/compline.lua which calls setup)
-- vim.cmd("colorscheme compline")