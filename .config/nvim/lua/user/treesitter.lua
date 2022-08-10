local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

require("orgmode").setup_ts_grammar() -- setup orgmode

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {"latex", "css" }, -- list of language that will be disabled
	},
  additional_vim_regex_highlighting = {"org"},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
