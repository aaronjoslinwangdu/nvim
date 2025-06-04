return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.formatting.stylua,
				require("none-ls.formatting.ruff_format"),
				require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			},
			-- 	-- Add this to be sure format-on-save is properly handled
			-- 	on_attach = function(client, bufnr)
			-- 		if client.supports_method("textDocument/formatting") then
			-- 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 			vim.api.nvim_create_autocmd("BufWritePre", {
			-- 				group = augroup,
			-- 				buffer = bufnr,
			-- 				callback = function()
			-- 					vim.lsp.buf.format({ bufnr = bufnr, async = false })
			-- 				end,
			-- 			})
			-- 		end
			-- 	end,
			-- })
			--
			-- -- Create a dedicated augroup for our formatting autocmds
			-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			--
			-- -- Manual keymap which works
			-- vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
			--
			-- -- Fallback global autocmd in case on_attach doesn't catch some buffers
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	group = augroup,
			-- 	callback = function()
			-- 		vim.lsp.buf.format({ async = false })
			-- 	end,
			-- })
		})
		-- Diagnostic window
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				header = false,
				border = "rounded",
				focusable = true,
			},
		})
	end,
}
