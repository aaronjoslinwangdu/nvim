return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			oldfiles = {
				include_current_session = true,
				cwd_only = true,
			},
			grep = {
				rg_glob = true,
				glob_flag = "--iglob",
			},
			previewers = {
				builtin = {
					syntax_limit_b = 1024 * 100,
				},
			},
		})

		-- use for code actions
		require("fzf-lua").register_ui_select()

		vim.api.nvim_set_keymap("n", "<leader>sf", ":lua require'fzf-lua'.files()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>sr", ":lua require'fzf-lua'.oldfiles()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>sb", ":lua require'fzf-lua'.buffers()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>sg", ":lua require'fzf-lua'.grep()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>ca", ":lua require'fzf-lua'.lsp_code_actions()<CR>", {})
		vim.api.nvim_set_keymap("n", "fu", ":lua require'fzf-lua'.lsp_references()<CR>", {})
		vim.api.nvim_set_keymap("n", "gd", ":lua require'fzf-lua'.lsp_definitions()<CR>", {})
	end,
}
