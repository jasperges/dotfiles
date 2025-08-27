require("full-border"):setup()
require("git"):setup()
require("bookmarks"):setup({
	last_directory = {
		enable = true,
		persist = true,
		mode = "jump",
	},
	persist = "all",
	show_keys = true,
})
