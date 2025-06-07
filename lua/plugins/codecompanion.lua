return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        opts = {
          log_level = "DEBUG",
        },
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "cmd:gpg --batch --quiet --decrypt ~/.config/nvim/.secrets/gemini_api_key.gpg"
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "gemini",
          },
          inline = {
            adapter = "gemini",
          },
        },
      })

      vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat<CR>", {})
      vim.keymap.set("n", "<leader>aa", ":CodeCompanionActions<CR>", {})
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}
