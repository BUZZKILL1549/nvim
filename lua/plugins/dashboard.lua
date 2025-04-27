local function center_text(text)
  local lines = vim.api.nvim_get_option_value("lines", {}) -- Get terminal height
  local padding = math.floor(lines / 6) -- Adjust division as needed
  local centered_text = {}
  for _ = 1, padding do
    table.insert(centered_text, "")
  end
  for _, line in ipairs(text) do
    table.insert(centered_text, line)
  end
  return centered_text
end

return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = center_text({
          "                                                              ",
          "  ██████╗ ██╗   ██╗███████╗███████╗██╗  ██╗██╗██╗     ██╗     ",
          "  ██╔══██╗██║   ██║╚══███╔╝╚══███╔╝██║ ██╔╝██║██║     ██║     ",
          "  ██████╔╝██║   ██║  ███╔╝   ███╔╝ █████╔╝ ██║██║     ██║     ",
          "  ██╔══██╗██║   ██║ ███╔╝   ███╔╝  ██╔═██╗ ██║██║     ██║     ",
          "  ██████╔╝╚██████╔╝███████╗███████╗██║  ██╗██║███████╗███████╗",
          "  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝",
          "                                                              ",
          "                                          [ BUZZKILL1549 ]    ",
          "                                                              ",
          "                                                              ",
          "                                                              ",
        }),
        center = {
          { icon = "  ", desc = "  NEW FILE   ", action = "ene | startinsert", key = "n" },
          { icon = "󰱼  ", desc = "  FIND FILE  ", action = "Telescope find_files", key = "f" },
          { icon = "  ", desc = "  RECENT FILES  ", action = "Telescope oldfiles", key = "r" },
          { icon = "  ", desc = "  CONFIGURATION  ", action = "edit ~/.config/nvim/init.lua", key = "c" },
          { icon = "  ", desc = "  QUIT  ", action = "qa", key = "q" },
        },
        footer = center_text({ "" }),
      },
    })
    
    -- Use pywal colors for dashboard
    local colors = vim.g.colors_name == "pywal" and {
      header = "${color4}", 
      center = "${color3}", 
      footer = "${color2}" 
    } or {
      header = "#89b4fa", -- if not using pywal
      center = "#fab387",
      footer = "#a6e3a1"
    }
    
    vim.cmd([[
      if filereadable(expand('~/.cache/wal/colors-wal.vim'))
        source ~/.cache/wal/colors-wal.vim
        hi DashboardHeader guifg=color4 guibg=NONE gui=bold
        hi DashboardCenter guifg=color3 guibg=NONE gui=bold
        hi DashboardFooter guifg=color2 guibg=NONE gui=italic
      endif
    ]])
  end,
}
