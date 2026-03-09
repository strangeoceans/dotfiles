require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 250,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
      },
      {
        function()
            local harpoon = require("harpoon")
            local current = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
            for i, item in ipairs(harpoon:list().items) do
              if vim.fn.fnamemodify(item.value, ":p") == current then
                return "󰛢" .. i
              end
            end
            return ""
        end
      },
    },
    lualine_x = {
      {
        'lsp_status',
        symbols = {
          spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
          done = '',
          separator = ' ',
        },
        icon = '',
        ignore_lsp = {},
        show_name = true,
      }
    },
    lualine_y = {
      'location',
    },
    lualine_z = {
      {
        function()
          return os.date('%H:%M')
        end,
        icon = ' '
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
