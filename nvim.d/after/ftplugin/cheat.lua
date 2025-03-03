-- cheat files behave like markdown
vim.cmd("setlocal filetype=cheat")
vim.cmd("runtime! ftplugin/markdown.lua")
vim.cmd("runtime! indent/markdown.lua")
vim.cmd("runtime! syntax/markdown.vim")
