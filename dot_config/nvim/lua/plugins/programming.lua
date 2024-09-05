return {
  -- Include some extra config from LazyVim

  -- -- Languages
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.terraform" },
  { import = "lazyvim.plugins.extras.lang.tex" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.helm" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.lang.ansible" },
  { import = "lazyvim.plugins.extras.lang.yaml" },

  -- -- Chezmoi
  { import = "lazyvim.plugins.extras.util.chezmoi" },

  -- Github Copilot
  -- { import = "lazyvim.plugins.extras.coding.copilot" },
}
