local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set("n", "<leader>e", function()
    if ls.expandable() then
        ls.expand()
    end
end, { desc = "Expand snippet" })

ls.add_snippets("go", {
    s("iferr", {
        t({ "if err != nil {", "\t" }),
        i(1, "return err"),
        t({ "", "}" }),
    }),
})
