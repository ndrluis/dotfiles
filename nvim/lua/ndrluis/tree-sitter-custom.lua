local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.sml = {
  install_info = {
    url = "/home/chronos/Workspace/oss/tree-sitter-sml",
    files = {"src/parser.c", "src/scanner.cc"}
  },
  filetype = "sml"
}

parser_config.jinja2 = {
  install_info = {
    url = "https://github.com/dbt-labs/tree-sitter-jinja2",
    files = {"src/parser.c"},
    branch = "main"
  },
  filetype = "jinja2"
}

