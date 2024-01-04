require("catppuccin").setup({
  style = "night",
  transparent = true,
  styles = {
    floats = "transparent", -- style for floating windows
  },
})

vim.cmd [[colorscheme catppuccin-mocha]]
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
