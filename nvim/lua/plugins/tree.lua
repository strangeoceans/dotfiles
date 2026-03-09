local tree = require("neo-tree")
local tree_command = require("neo-tree.command")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function() tree_command.execute({ action = "close" }) end,
    },
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
	renderer = { group_empty = true },
	git = { ignore = false },
})
