return {
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "sindrets/diffview.nvim" },
		cmd = "Neogit",
		branch = "nightly",
		opts = {
			disable_signs = false,
			disable_context_highlighting = false,
			disable_commit_confirmation = true,
			kind = "vsplit",
			integrations = { diffview = true, telescope = true },
			commit_view = {
				kind = "split",
				verify_commit = os.execute("which gpg") == 0, -- Can be set to true or false, otherwise we try to find the binary
			},
		},
	},
}
