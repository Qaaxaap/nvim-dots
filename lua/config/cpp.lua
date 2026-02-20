local function setup_cpp()
  -- 启用 C 风格缩进
  vim.bo.cindent = true
  
  -- 关键设置：namespace 内缩进
  -- ":1" 表示在 namespace 中缩进一级
  -- "g1" 表示 C++ 访问修饰符后缩进
  vim.bo.cinoptions = vim.bo.cinoptions .. ":1"
  
  -- 或者使用完整设置
  -- vim.bo.cinoptions = "g0:0:0"
end

-- 应用设置到 C++ 文件
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "h", "hpp" },
  callback = setup_cpp
})
