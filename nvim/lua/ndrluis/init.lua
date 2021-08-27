require("ndrluis.lsp")
require("ndrluis.telescope")
require("ndrluis.tree-sitter-custom")

require('nvim-autopairs').setup{}

require('nvim-tree').setup {
  git = {
    ignore = false
  }
}

require('gitsigns').setup()

require('lualine').setup{
  theme = 'gruvbox_dark',
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {
        "diagnostics",
        sources = {"nvim_diagnostic"},
        symbols = {error = ' ', warn = ' ', info = ' '},
      },
      "encoding",
      "fileformat",
      "filetype",
      "g:currentContainer"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  }
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
  }
)
