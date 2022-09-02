local status_ok, spellsitter = pcall(require, "spellsitter")
if not status_ok then
  return
end

spellsitter.setup({
  highlight = {
    enable = true,
    -- additional_vim_regex_highlighting = true, -- DO NOT SET THIS
  },
})
