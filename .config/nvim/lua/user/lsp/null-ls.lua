local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local completion = null_ls.builtins.completion
-- local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml", "latex", "markdown" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.stylua,
		formatting.google_java_format,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort.with({ extra_args = { "--profile", "black" }, filetypes = { "python" } }),
		diagnostics.flake8,
    diagnostics.cppcheck,
		--    diagnostics.pylint,
		diagnostics.proselint, --.with({ filetypes = { "markdown", "latex" } }),
    code_actions.gitsigns,
		code_actions.proselint, --.with({ filetypes = { "markdown", "latex" } }),
		completion.spell.with({
			filetypes = { "latex", "markdown" },
		}),
	},
})
