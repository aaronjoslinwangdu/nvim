vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set inccommand=split")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.scrolloff = 10

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.keymap.set("n", "<leader>Q", vim.cmd.copen, { silent = true })
vim.keymap.set("n", "<leader>q", vim.cmd.cclose, { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
