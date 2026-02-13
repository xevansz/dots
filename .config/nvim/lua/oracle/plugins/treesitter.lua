-- 1. Safe Load Mechanism
-- We try to import the configs. If it fails (status is false), we simply return.
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- 2. Your Configuration
configs.setup {
    -- A list of parser names, or "all"
    ensure_installed = "all",

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    highlight = {
        enable = true,
        -- Setting this to true will run syntax highlighting even if the parser isn't installed, 
        -- which can be slow. Keep it true only if you want TreeSitter highlighting.
        additional_vim_regex_highlighting = false, 
    },
    
    -- Note: This 'autopairs' section usually requires the "nvim-autopairs" plugin 
    -- to be installed separately to work effectively.
    autopairs = {
        enable = true,
    },
}
