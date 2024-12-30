-- Vim-Dadbod/Vim-Dadbod-Ui Custom Keymaps
-- Source: https://github.com/kristijanhusak/vim-dadbod-ui/tree/master?tab=readme-ov-file#mappings

-- custom keymap example: 'v' key within 'dbui' buffer will open item on 
--													current line in a new vertical split
--
autocmd FileType dbui nmap <buffer> v <Plug>(DBUI_SelectLineVsplit)
