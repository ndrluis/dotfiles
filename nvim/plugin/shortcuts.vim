" Search

nnoremap <leader>F :lua require'telescope.builtin'.current_buffer_fuzzy_find(require'telescope.themes'.get_dropdown { border = true, previewer = false, layout_config={width = 0.70} })<CR>
nnoremap <Leader>f :lua require('telescope.builtin').find_files{}<CR>
nnoremap <Leader>fg :lua require('telescope.builtin').live_grep{}<CR>
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>b :lua require('telescope.builtin').buffers{}<CR>

nnoremap <Leader>gc :lua require('ndrluis.telescope').git_branches()<CR>

" Undo tree view
nnoremap <Leader>u :UndotreeShow<CR>

" Split windows with 'alternate' file (like a spec for a rails model)
noremap <C-w>a <Esc><C-w>v :A<CR><Esc>
noremap <C-w>A <Esc><C-w>s :A<CR><Esc>

"" vim-test mappings
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>T :TestFile<CR>
map <silent> <leader>a :TestSuite<CR>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" get back to normal mode
imap jj <esc>
imap kk <esc>

" Actions
nmap <leader>gs :Git<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>q :bd<CR>

" Debugger
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dr :call vimspector#Reset()<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))

nnoremap <leader>nf :NvimTreeFindFile<CR>
nnoremap <leader>n :NvimTreeToggle<CR>
