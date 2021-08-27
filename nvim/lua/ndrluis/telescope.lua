local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require("telescope.themes")


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<c-n>"] = false,
        ["<c-p>"] = false,

        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

local M = {}

function M.git_branches()
  builtin.git_branches(
    themes.get_dropdown {
      winblend = 10,
      border = true,
      previewer = false,
    }
  )
end

return M
