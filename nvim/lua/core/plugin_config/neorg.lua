require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    zettel = "~/notes/zettel",
                    work = "~/notes/work",
                    privat = "~/notes/privat",
                },
            },
        },
    },
}

