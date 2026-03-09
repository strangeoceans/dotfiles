vim.g.mapleader = "'"
vim.g.maplocalleader = "'"

if not (os.getenv("NVIM_USE_SYSTEM_PLUGINS") == "1") then
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

  require("lazy").setup({
    spec = {
      { "romgrk/barbar.nvim" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "brenoprata10/nvim-highlight-colors" },
      { "nvim-lualine/lualine.nvim" },
      { "folke/persistence.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-neo-tree/neo-tree.nvim" },
      { "https://git.sr.ht/~p00f/alabaster.nvim" },
      { "justinmk/vim-sneak" },
      { "mfussenegger/nvim-jdtls" },
      { "nvim-tree/nvim-web-devicons" },
      { "neovim/nvim-lspconfig" },
      { "nvim-treesitter/nvim-treesitter" },
      { "L3MON4D3/LuaSnip" },
      { "MunifTanjim/nui.nvim" },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = false },
  })
end

require('autocmds')
require('cmds')
require('lsp')
require('maps')
require('opts')

require('plugins.barbar')
require('plugins.cmp')
require('plugins.colors')
require('plugins.lualine')
require('plugins.persistence')
require('plugins.telescope')
require('plugins.tree')
