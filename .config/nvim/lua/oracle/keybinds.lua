-- exit to file tree
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("x", "<leader>p", [["_dP]])

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

keymap("n", "Q", "<nop>")
keymap("n", "<leader>f", vim.lsp.buf.format)

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap("n", "<Left>", "<nop>")
keymap("n", "<Right>", "<nop>")
keymap("n", "<Up>", "<nop>")
keymap("n", "<Down>", "<nop>")

-- Move lines (Alt+j / Alt+k)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Swap w behavior (previous word start)
keymap("n", "w", "b", opts)

-- Visual/select extension equivalents
keymap("v", "<Tab>", ">", opts)
keymap("v", "<S-Tab>", "<", opts)

-- yazi
keymap("n", "<leader>E", function()
  local tmp = "/tmp/unique-file"
  os.execute("rm -f " .. tmp)
  os.execute("yazi " .. vim.fn.expand("%") .. " --chooser-file=" .. tmp)
  local f = io.open(tmp)
  if f then
    local file = f:read("*l")
    f:close()
    if file then vim.cmd("edit " .. file) end
  end
end, opts)

-- git blame 
keymap("n", "<leader><leader>b", function()
  local line = vim.fn.line(".")
  local file = vim.fn.expand("%")
  vim.cmd("!" ..
    "git blame -L " .. line .. "," .. line ..
    ' --date=relative -- "' .. file .. '"')
end, opts)
