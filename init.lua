----------- Vim.cmds -----------
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

----------- Package Manager -----------

-- Using Lazy.vim 
-- [https://github.com/folke/lazy.nvim]

-- Bootstrap 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Pre-Lazy setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugins
local plugins = {
  -- Catppuccin theme 
  -- [https://github.com/catppuccin/nvim]
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Telescope
  -- [https://github.com/nvim-telescope/telescope.nvim]
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}

-- Options
local opts = {}

-- Get all plugins from Lazy
require("lazy").setup(plugins, opts)

-- Catppuccin setup
require("catppuccin").setup({
  no_italic = true
})
vim.cmd.colorscheme "catppuccin-mocha"

-- Telescope setup
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
