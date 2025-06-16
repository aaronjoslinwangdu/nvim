return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>gb", ":G blame<CR>", {})
			vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiffsplit<CR>", {})
			vim.api.nvim_set_keymap("n", "<leader>go", ":GBrowse<CR>", {})
			vim.api.nvim_set_keymap("n", "<leader>gm", ":G mergetool<CR>", {})
		end,
	},
}
