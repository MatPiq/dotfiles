local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  return
end

orgmode.setup({
  org_agenda_files = {'~/Org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Org/refile.org',
})
