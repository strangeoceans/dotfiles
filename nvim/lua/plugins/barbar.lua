require('barbar').setup({
  clickable = false,
  highlights = {
    fill = { bg = "#242933" },
  },
  is_hidden = function(buf)
    return vim.fs.basename(vim.api.nvim_buf_get_name(buf)):match('^claude%-code%-%-') ~= nil
  end,
})
