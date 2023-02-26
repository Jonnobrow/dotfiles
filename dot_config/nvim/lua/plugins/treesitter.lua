return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- @type TSConfig
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "help",
        "html",
        "java",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "terraform",
        "toml",
        "vim",
        "yaml",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
  },
}
