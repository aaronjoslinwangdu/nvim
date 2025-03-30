-- [https://github.com/nvim-treesitter/nvim-treesitter]
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter_config = require("nvim-treesitter.configs")
    treesitter_config.setup({
      auto_install = true,
      ensure_installed = {
        "lua",
        "astro",
        "typescript",
        "javascript",
        "tsx",
        "html",
        "css",
        "python",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
