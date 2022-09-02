local status_ok, vimwiki = pcall(require, "vimwiki.config")
if not status_ok then
  return
end

vimwiki.setup({
  config = function()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki",
        template_path = "default",
        template_default = "default",
        syntax = "markdown",
        ext = ".md",
        path_html = "~/vimwiki",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
      },
    }
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
      [".markdown"] = "markdown",
      [".mdown"] = "markdown",
    }
  end,
})
