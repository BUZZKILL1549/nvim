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

    -- Make the dashboard menu text larger and bold
    vim.cmd([[
      hi DashboardCenter guifg=#fab387 guibg=NONE gui=bold
      hi DashboardHeader guifg=#89b4fa guibg=NONE gui=bold
      hi DashboardFooter guifg=#a6e3a1 guibg=NONE gui=italic
    ]])
  end,
}
