require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "javascript",
    "typescript",
    "lua",
    "php",
    "query",
    "html",
    "css",
    "scss",
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require"nvim-treesitter.install".compilers = { "zig" }
