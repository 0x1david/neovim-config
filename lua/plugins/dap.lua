local dap = require("dap")
local ui = require("dapui")
require("dapui").setup()

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = "${port}",
  executable = {
    command = '/usr/bin/codelldb',
    args = {"--port", "${port}"},
  }
}

vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
vim.keymap.set("n", "<space>?", function()
    require("dapui").eval(nil, { enter = true })
end)
vim.keymap.set("n", "<space>+", dap.continue)
vim.keymap.set("n", "<space>[", dap.step_into)
vim.keymap.set("n", "<space>[", dap.step_over)
vim.keymap.set("n", "<space>(", dap.step_out)
vim.keymap.set("n", "<space>&", dap.step_back)
vim.keymap.set("n", "<space>/", dap.restart)

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end

dap.listeners.before.launch.dapui_config = function()
    ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end
