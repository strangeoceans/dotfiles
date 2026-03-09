vim.opt.wrap = false vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.cmdheight = 1
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 2
vim.opt.foldnestmax = 2
vim.opt.background = "dark"
vim.diagnostic.config({ virtual_text = false })
vim.cmd.colorscheme("alabaster")
vim.api.nvim_set_hl(0, "Normal", { fg="#c0c8d8", bg="#242933" })

require('nvim-treesitter.config').setup {
  highlight = {
    enable = false,
  },
}
