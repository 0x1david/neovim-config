local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    rust = { "rustfmt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Optional: Set up a key mapping for manual formatting
vim.keymap.set("n", "<leader>f", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })
