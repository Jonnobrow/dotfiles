-- Python
require'lspconfig'.pyright.setup{
  settings = {
    python = {
      linting = {
        flake8Enabled = true
      }
    }
  }
}

-- Docker
require'lspconfig'.dockerls.setup{}

-- Go
require'lspconfig'.gopls.setup{}

-- HTML
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- JSON
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- Rust (TODO: Look into rustanalyzer)
require'lspconfig'.rls.setup{}

-- Terraform
require'lspconfig'.terraformls.setup{}

-- TeX
require'lspconfig'.texlab.setup{
    settings = {
      bibtex = {
        formatting = {
          lineLength = 120
        }
      },
      latex = {
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=./build", "%f" },
          executable = "latexmk",
          onSave = true,
          outputDirectory = "./build"
        },
        forwardSearch = {
          executable = "zathura",
          args = {"--synctex-forward", "%l:1:%f", "%p"},
          onSave = true
        },
        lint = {
          onChange = true
        }
      }
    }
}

-- Typescript/JavaScript etc.
require'lspconfig'.tsserver.setup{}

-- YAML
require'lspconfig'.yamlls.setup{}

-- EFM
local vim = vim
local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}
local efmlanguages = {
    scss = {prettier},
    css = {prettier},
    markdown = {prettier}
}
require'lspconfig'.efm.setup {
    root_dir = vim.loop.cwd,
    filetypes = vim.tbl_keys(efmlanguages),
    init_options = {documentFormatting = true, codeAction = true},
    settings = {
      languages = languages,
      log_level = 1,
      log_file = '~/.local/share/efm.log'
    }
}
