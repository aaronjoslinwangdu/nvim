return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
      vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>sr", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
      vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
      vim.keymap.set("n", "fu", builtin.lsp_references, {})
      vim.keymap.set("n", "td", builtin.lsp_type_definitions, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local live_grep = {
        theme = "dropdown",
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules", ".git", ".venv" },
      }
      local with_preview = {
        theme = "dropdown",
        path_display = { "truncate" },
      }
      local without_preview = {
        theme = "dropdown",
        previewer = false,
        path_display = { "truncate" },
      }
      require("telescope").setup({
        pickers = {
          find_files = without_preview,
          buffers = without_preview,
          oldfiles = without_preview,
          live_grep = live_grep,
          lsp_references = with_preview,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
