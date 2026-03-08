-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.keymap.set("n", "<F9>", function()
            vim.cmd("w")
            -- 打开终端并立即进入插入模式
            vim.cmd("belowright 15split")
            vim.cmd("terminal cd '%:p:h' && g++ -std=c++23 -O2 '%:t' -o '%:r' && ./'%:r'")
            vim.cmd("startinsert") -- 关键：进入插入模式
        end, { buffer = true, desc = "Compile and run code" })
    end,
})
-- 为 Nix 语言设置特定的缩进规则 (1 tab = 2 spaces)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    -- 使用 opt_local 确保设置仅应用于 Nix 缓冲区，不影响其他文件类型
    vim.opt_local.tabstop = 2      -- 文件中一个 Tab 显示的宽度
    vim.opt_local.shiftwidth = 2   -- 自动缩进使用的空格数
    vim.opt_local.softtabstop = 2  -- 编辑时（如按 Tab 或 Backspace）一个 Tab 占用的空格数
    vim.opt_local.expandtab = true -- 将 Tab 键输入转换为空格
    
    -- vim.opt_local.indentexpr = ""     -- 确保没有其他缩进表达式
    vim.opt_local.cindent = true      -- 启用 C 风格缩进
    vim.opt_local.smartindent = true -- 关闭 smartindent 避免干扰
    vim.opt_local.autoindent = true   -- 保留 autoindent（复制上一行缩进）
    -- 2. 覆盖 <CR> 的行为
    --vim.keymap.set('i', '<CR>', function()
      -- 检查补全菜单是否可见
      --if vim.fn.pumvisible() == 1 then
        -- 补全菜单打开时，返回 <C-y> 确认选中项
        -- （如果 blink.cmp 使用其他键，可查阅其文档调整）
        --return '<C-y>'
      --else
        -- 否则执行默认回车（插入换行并缩进）
      --  return '<CR>'
      --end
    --end, { buffer = true, expr = true, noremap = true })
  end,
})
