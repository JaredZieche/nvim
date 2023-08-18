return {
    {
        "NeogitOrg/neogit",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Neogit",
        opts = {
            disable_signs = false,
            disable_context_highlighting = false,
            disable_commit_confirmation = true,
            -- customize displayed signs
            signs = {
                -- { CLOSED, OPENED }
                section = {">", "v"},
                item = {">", "v"},
                hunk = {"", ""}
            },
            kind = "vsplit",
            integrations = {diffview = true},
            -- override/add mappings
            mappings = {
                -- modify status buffer mappings
                status = {
                    -- Adds a mapping with "B" as key that does the "BranchPopup" command
                    ["B"] = "BranchPopup"
                    -- ["C"] = "CommitPopup",
                    -- ["P"] = "PullPopup",
                    -- ["S"] = "Stage",
                    -- ["D"] = "Discard",
                    -- Removes the default mapping of "s"
                    -- ["s"] = "",
                }
            }
        }
    }
}