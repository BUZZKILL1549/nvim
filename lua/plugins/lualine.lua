return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "catppuccin/nvim",
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = "catppuccin",
          section_seperators = { '', '' },
          component_seperators = { '', ''},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'filename', 'diagnostics' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'fugitive' }
      })
    end,
  },
}
