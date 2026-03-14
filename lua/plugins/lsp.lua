return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- 关键配置：告诉 lspconfig 不要通过 mason 来安装/管理 clangd
          mason = false, 
          -- 可以显式指定系统 clangd 的路径，确保使用的是我们刚安装的
          cmd = { 
            "/run/current-system/sw/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never", 
          },
        },
      },
    },
  },
  -- 如果你使用 mason-lspconfig，也要确保它不会自动为 clangd 安装服务器
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { 
        -- 从列表中移除 "clangd"，或者使用一个忽略列表
      },
    },
  },
}
