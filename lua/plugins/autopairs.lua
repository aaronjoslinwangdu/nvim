  -- [https://github.com/windwp/nvim-autopairs]
  return { 
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        event = "InsertEnter",
        config = true,
      })
    end,
  }
