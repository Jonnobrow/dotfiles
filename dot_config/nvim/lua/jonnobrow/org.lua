require("orgmode").setup({
    org_agenda_files = {'~/dirs/doc/org/**/*'},
    org_default_notes_file = '~/dirs/doc/org/refile.org',
    notifications = {
        reminder_time = {0, 5, 15}
    },
    org_todo_keywords = {
        "TODO(t)", "WAITING(w)",
        "|",
        "CANCELLED(c)", "DONE(d)"
    },
    org_hide_leading_stars = true,
    org_agenda_templates = {
        t = {
            description = "Todo",
            template = '* TODO %?\n',
            target = "~/dirs/doc/org/refile.org"
        },
        l = {
            description = "Sky Logbook Entry",
            template = "** %U %?",
            target = "~/dirs/doc/org/logbook.org"
        }
    },
    org_highlight_latex_and_related = "native"
})
