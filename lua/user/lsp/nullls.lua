local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
	sources = {
		formatting.stylua,
    formatting.gofmt,
    formatting.goimports,
    diagnostics.golangci_lint,
    formatting.autopep8,
    diagnostics.pylint,
    diagnostics.eslint.with({prefer_local = "node_modules/.bin"}),
    formatting.prettier.with({prefer_local = "node_modules/.bin"}),
	},
})
