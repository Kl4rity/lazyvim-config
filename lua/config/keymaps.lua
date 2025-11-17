-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Neotest keymaps
vim.keymap.set("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run Nearest Test" })

vim.keymap.set("n", "<leader>tT", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run Test File" })

vim.keymap.set("n", "<leader>td", function()
  require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug Nearest Test" })

vim.keymap.set("n", "<leader>tD", function()
  require("neotest").run.run(vim.fn.expand("%"), { strategy = "dap" })
end, { desc = "Debug Test File" })

vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle Test Summary" })

vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { desc = "Open Test Output" })

vim.keymap.set("n", "<leader>tO", function()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle Test Output Panel" })