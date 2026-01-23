-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.shiftwidth = 4 -- Size of an indent
vim.g.autoformat = true
-- 设置全局缩进
opt.tabstop = 4 -- 一个制表符显示为4个空格宽度
opt.expandtab = true -- 将制表符转换为空格
opt.relativenumber = false
