so ~/.config/nvim/bundle.vim

lua require("ndrluis")

let mapleader = " "
nnoremap <SPACE> <Nop>

" Delete trailing white space when saving
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * :call DeleteTrailingWS()

let g:python3_host_prog = '/home/chronos/.asdf/installs/python/3.8.5/bin/python3'

set exrc
set secure

" sensible settings
set clipboard=unnamedplus
set encoding=utf-8
set fileencoding=utf8
set wildoptions=pum
set wildmode=list:longest,list:full
set hidden
set expandtab
set shell=bash
set backspace=indent,eol,start
set shiftround
set backupdir=~/.cache/nvim
set directory=~/.cache/nvim
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noswapfile
set nobackup
set relativenumber

" fast
set lazyredraw
set timeoutlen=450
set updatetime=250

" fancy
set cursorline
set colorcolumn=80
set termguicolors
set cmdheight=2
set nonumber
set laststatus=2
set scrolloff=5
set list lcs=trail:·,tab:»·
set pumblend=30

set background=dark
colorscheme gruvbox8_soft

let &sbr=nr2char(8618).' '
set signcolumn=yes
set number

hi SignColumn guibg='#1d2021'
hi GitGutterAdd guibg='#1d2021' guifg='#b8bb26'
hi GitGutterChange guibg='#1d2021' guifg='#fabd2f'
hi GitGutterDelete guibg='#1d2021' guifg='#cc241d'
hi GitGutterChangeDelete guibg='#1d2021' guifg='#fb4934'

set undodir=~/.vim/undodir
set undofile

" Yank till the end of the line with Y
nnoremap Y y$

"disables F1 for help
nnoremap <F1> <nop>

"disables ex mode
nnoremap Q <nop>

" ignores for CtrlP
set wildignore+=*.o,*.obj,.git,*/tmp/**,*/build/**,*/coverage/**,.jhw-cache,*/.yardoc/**,*/public/source_maps/**,**/node_modules/**,*/vendor/bundle/**,*/target/**

" search options
set ignorecase smartcase gdefault showmatch hlsearch incsearch

if has("pythonx")
  set pyx=3
  set pyxversion=3
endif

if has("mouse")
  set mouse=a
endif

let g:test#javascript#mocha#file_pattern = '\v(tests?/.*|(test))\.(js|jsx|coffee|ts|tsx)$'

function! TypeScriptTransform(cmd) abort
  return substitute(a:cmd, '\v(.*)mocha', 'NODE_ENV=${NODE_ENV:=test} TS_NODE_TRANSPILE_ONLY=true \1mocha', '')
endfunction
let g:test#custom_transformations = {'typescript': function('TypeScriptTransform')}
let g:test#transformation = 'typescript'

function! AsyncRunCustomStrategy(cmd)
  call asyncrun#run("!", {"mode": "term", "pos": "bottom", "focus": 0, "rows": 10}, a:cmd)
endfunction

let g:test#custom_strategies = {'asyncrun_custom': function('AsyncRunCustomStrategy')}
let g:test#strategy = "asyncrun_custom"
let g:test#python#pytest#executable = "docker-compose run --rm data_image pytest -vv"
let test#python#runner = 'pytest'

tnoremap <Esc> <C-\><C-n>
inoremap <C-c> <esc>

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" Avoid showing message extra message when using completion
set shortmess+=c

let g:telescope_prime_fuzzy_find  = 1
let g:vim_npr_max_levels = 20

let g:vimspector_install_gadgets = ['vscode-node-debug2']
let g:vimspector_enable_mappings = 'HUMAN'

let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_sql = []

let g:sml_auto_create_def_use = "always"

augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

augroup vimbettersml
  au!

  " ----- Keybindings -----

  au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
  au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  " set the print depth to 100
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

  " ----- Other settings -----

  " Uncomment to try out conceal characters
  "au FileType sml setlocal conceallevel=2

  " Uncomment to try out same-width conceal characters
  "let g:sml_greek_tyvar_show_tick = 1
augroup END

autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy
autocmd BufNewFile,BufRead *.py.j2 set ft=python
