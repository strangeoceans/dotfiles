vim.api.nvim_create_user_command("Rename", function(args)
	vim.lsp.buf.rename(args["args"])
end, { nargs = 1 })
