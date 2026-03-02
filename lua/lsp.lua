-- LSP settings
require("neoconf").setup({})
local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)

        vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function()
            vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
    end,
})

-- nvim-cmp Autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Language Servers
local servers = { 'clangd', 'bashls', 'tailwindcss', 'html', 'pyright', 'gopls', 'lua_ls', 'hls', 'ts_ls' }

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities,
    })
    vim.lsp.enable(lsp)
end

-- Rust
vim.g.rustaceanvim = {
    tools = {},
    server = {
        capabilities = capabilities,
    }
}

-- Ocaml
vim.lsp.config('ocamllsp', {
    cmd = { 'ocamllsp' },
    filetypes = { 'ocaml', 'ocaml.interface', 'ocaml.ocamllex', 'ocaml.menhir' },
    root_dir = lspconfig.util.root_pattern('*.opam', 'esy.json', 'package.json', '.git'),
    capabilities = capabilities,
})
vim.lsp.enable('ocamllsp')

-- Ocaml format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ml", "*.mli" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- C#
require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

local roslyn_ok, roslyn = pcall(require, "roslyn")
if roslyn_ok then
    roslyn.setup({
        capabilities = capabilities,
        config = {
            capabilities = capabilities,
        }
    })
end

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Set completeopt to have a better completion experience.
vim.o.completeopt = 'menuone,noselect'
