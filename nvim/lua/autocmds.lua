vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.api.nvim_feedkeys("A", "n", false)
	end,
})

vim.api.nvim_create_autocmd("TermClose", {
	pattern = "*",
	callback = function()
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "t", false)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt.buflisted = false
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.nix",
  callback = function(args)
    vim.fn.jobstart({ "treefmt", args.file }, {
      on_exit = function()
        vim.schedule(function()
          vim.cmd("checktime " .. args.buf)
        end)
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

