return {
{
    "blanktiger/telescope-rg.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension("ripgrep")
        end,

    },
    opts = {
        -- your config goes here
    }
}
}
