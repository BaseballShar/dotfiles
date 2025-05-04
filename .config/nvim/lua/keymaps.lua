-- Setup nvim keymaps
-- Can use "nv" as shorthand in modeStr for normal and visual mode
local function map(modeStr, lhs, rhs, desc)
  local modeTable = modeStr or "n"
  if modeStr == "nv" then
    modeTable = { "n", "v" }
  end
  vim.keymap.set(modeTable, lhs, rhs, { desc = desc or "", silent = true })
end

-- Better intraline movements
map("nv", "H", "_", "End of line")
map("nv", "L", "$", "Start of line")

-- Center after moving pages
map("n", "<C-u>", "<C-u>zz", "Scroll up half a page")
map("n", "<C-b>", "<C-b>zz", "Scroll up a page")
map("n", "<C-d>", "<C-d>zz", "Scroll down half a page")
map("n", "<C-f>", "<C-f>zz", "Scroll down a page")

-- Change split sizes
map("n", "<S-Down>", ":resize -2<CR>", "Shrink pane vertically")
map("n", "<S-Left>", ":vertical resize -2<CR>", "Shrink pane horizontally")
map("n", "<S-Right>", ":vertical resize +2<CR>", "Grow pane horizontally")
map("n", "<S-Up>", ":resize +2<CR>", "Grow pane vertically")
map("n", "+", "<C-w>=", "Equalise pane size")

-- Exit to normal mode swiftly
map("i", "jk", "<ESC>", "Escape to normal mode")
map("t", "jk", "<C-\\><C-n>", "Escape to normal mode")

-- Change windows easily
map("n", "<C-h>", "<C-w>h", "Move to left pane")
map("n", "<C-l>", "<C-w>l", "Move to right pane")
map("n", "<C-j>", "<C-w>j", "Move to down pane")
map("n", "<C-k>", "<C-w>k", "Move to up pane")

-- Quit and save easily
map("n", "<Leader>q", ":q<CR>", "Quit")
map("n", "<Leader>s", ":w<CR>", "Save")

-- Open nvim builtin terminal
map("n", "<C-t>", ":terminal<CR>", "Open builtin terminal")
