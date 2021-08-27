set completeopt=menu,menuone,preview,noselect,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>

nnoremap grn :lua vim.lsp.buf.rename()<CR>

nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent><leader>ld :call LspLocationList()<CR>
nnoremap <silent><leader>d <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>

nnoremap <silent>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
