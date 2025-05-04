-- Toggle diagonstics on and off
local function toggle_diagnostic()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    print("LSP Diagonstics Disabled")
  else
    vim.diagnostic.enable()
    print("LSP Diagonstics Enabled")
  end
end

vim.keymap.set("n", "<Leader>dt", toggle_diagnostic)
