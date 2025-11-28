require('zen.plugins')
require('zen.settings')
require('zen.keybinds')
require('pywal').setup()

vim.opt.rtp:append(vim.fn.stdpath("config") .. "/lua/zen/colorscheme")

vim.cmd("colorscheme compline")
