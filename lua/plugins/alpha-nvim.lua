local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  '',
  '',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⢧',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣵⣶⣾⡶⠶⠿⠿⠶⠿⠾⠶⠶⠼⢮⣙⠢⠤⣀⡀',
  '⣿⣿⣿⣿⣿⣿⣟⣿⣽⣵⣶⠾⠿⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⡲⣦⣀',
  '⣿⣛⣯⣭⣵⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⡇',
  '⡿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁',
  '⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢀⣰⣿⡿⠀⠀⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠖⠉',
  '⣰⣀⣼⣿⣇⢰⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⣀⣠⣾⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠖⠉',
  '⣿⡿⢻⠟⠿⠈⠀⠀⠀⠀⣠⣴⣦⣤⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⢸⡇',
  '⠉⠁⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠄⠀⠀⠀⠀⠀⢸⡇',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠌⠁⠀⠀⠀⠀⠀⠀⠀⢸⡇',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢿⣦⣽⣿⣿⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠻⣿⣿⣿⣿⣿⣷⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⢠⡞',
  '⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⢙⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⢀⣤⠶⠖⠉',
  '⠀⢀⣰⣦⣭⣿⣷⣤⣔⣣⠀⠱⣗⢬⠙⠻⢿⣿⣿⣿⣿⣿⡟⠁⢰⠏⠉',
  '⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠈⠡⠐⣠⡶⠦⣭⣙⣛⣉⣠⡴⠏',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⡏⠀⠀⠀⠈⠉⠉⠉',
}

dashboard.section.buttons.val = {
  dashboard.button("n", "  New File", "<Cmd>ene <BAR> startinsert<CR>"),
  dashboard.button("p", "  Search Projects", "<Cmd>Telescope projects<CR>"),
  dashboard.button("e", "  NvimTree Explorer", "<Cmd>NvimTreeToggle<CR>"),
  dashboard.button("l", "󰒲  Lazy Manage", "<Cmd>Lazy<CR>"),
  dashboard.button("s", "  Setting", "<Cmd>e $MYVIMRC<CR>"),
  dashboard.button("q", "󰩈  Quit Neovim", "<Cmd>qa<CR>")
}

local stats = require("lazy").stats()
dashboard.section.footer.val = "󱓟  GIN-Neovim loaded " .. stats.count .. " plugins"

alpha.setup(dashboard.opts)

vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
