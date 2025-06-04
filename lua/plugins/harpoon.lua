return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>z", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- open files
		vim.keymap.set("n", "<F1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<F2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<F3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<F4>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
