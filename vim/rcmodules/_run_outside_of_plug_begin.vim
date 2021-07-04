
if &runtimepath =~ 'deoplete'
    " REF (Bug): https://github.com/carlitux/deoplete-ternjs/issues/88#issuecomment-713913170
    call deoplete#custom#option('num_processes', 4)
endif



if &runtimepath =~ 'treesitter'
    lua <<EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
        highlight = {
        enable = true,              -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
}
EOF
endif
