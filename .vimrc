filetype plugin indent on
set nocompatible              " be iMproved, required filetype off                  " required
set termguicolors

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set autoread
set lazyredraw
set scrolloff=8

set relativenumber
set expandtab tabstop=2 softtabstop=2 shiftwidth=2 number
set t_Co=256
syntax on
colorscheme minimalist 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bottom line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Collection of common configurations for the Nvim LSP client
Plugin 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plugin 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plugin 'nvim-lua/completion-nvim'

" Diagnostic navigation and settings for built-in LSP
Plugin 'nvim-lua/diagnostic-nvim'

Plugin 'stevearc/vim-arduino'
Plugin 'chrisbra/vim-xml-runtime'

" Vim Stuff
" GUI Stuff
Plugin 'mhinz/vim-startify'
" Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'machakann/vim-highlightedyank'

" Language Stuff
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Web Dev
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'jparise/vim-graphql'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

" Searching Stuff
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install all'}
Plugin 'junegunn/fzf.vim'

" Java Stuff
Plugin 'uiiaoo/java-syntax.vim'
Plugin 'tfnico/vim-gradle'

" Python Stuff
" Plugin 'kiteco/vim-plugin'

" Rust Stuff
" Plugin 'rust-lang/rls'
" Plugin 'rust-lang/rust.vim'

" Ruby Stuff
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" CPP Stuff
Plugin 'bfrg/vim-cpp-modern'
Plugin 'rhysd/vim-clang-format'

" Code formatting (for c++)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" MD Stuff
Plugin 'godlygeek/tabular'
Plugin 'davidgranstrom/nvim-markdown-preview'
Plugin 'iamcco/markdown-preview.nvim'

" Meta Stuff
Plugin 'junegunn/vader.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'jreybert/vimagit'
Plugin 'cespare/vim-toml'
Plugin 'stephpy/vim-yaml'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/chris/.vim/bundle/google-java-format-1.8-all-deps.jar"

filetype plugin indent on    " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve remova


" --------------- RUST LSP STUFF --------------------------
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.tsserver.setup{}

EOF

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold DEPRICATED
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']


if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use auocmd to force lightline update.
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
autocmd BufEnter *.{js,jsx,ts,tsx,toml,rb} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,toml,rb} :syntax sync clear
autocmd BufEnter *md colorscheme Gruvbox
autocmd FileType c,cpp,proto,ino AutoFormatBuffer clang-format
autocmd FileType java AutoFormatBuffer google-java-format

au BufNewFile,BufFilePre,BufRead *.toml set filetype=toml
au BufNewFile,BufFilePre,BufRead *.spec set filetype=python
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.tsx set filetype=typescript.tsx

set hidden

let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 0

" let g:kite_supported_languages = ['python', 'go']
let g:vim_markdown_folding_disabled = 1

" Mappings
let mapleader = "\<Space>"
nmap <leader>; :Buffers<CR>
        function! CleverTab()
           if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
              return "\<Tab>"
           else
              return "\<C-N>"
           endif
        endfunction
        inoremap <Tab> <C-R>=CleverTab()<CR>
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
autocmd Filetype ruby nnoremap <buffer><C-f> :Rufo<CR>

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Quick-save
nmap <leader>w :w<CR>
map <leader>f :Files<CR>
map <leader>q :q!<CR>

set runtimepath+=~/.vim-plugins/LanguageClient-neovim

" ------------------------ OLD CONFIG -----------------------
"
"  -------------------- Lightline ---------------------------------------
"let g:lightline = {
"			\ 'colorscheme': 'Tomorrow_Night',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ]
"      \ },
"      \ 'component_function': {
"      \   'filename': 'LightlineFilename',
"      \   'cocstatus': 'coc#status'
"      \ },
"			\ 'component_expand': {
"  \   'coc_error'        : 'LightlineCocErrors',
"  \   'coc_warning'      : 'LightlineCocWarnings',
"  \   'coc_info'         : 'LightlineCocInfos',
"  \   'coc_hint'         : 'LightlineCocHints',
"  \   'coc_fix'          : 'LightlineCocFixes',
"			\ }
"      \ }
"function! LightlineFilename()
"  return expand('%:t') !=# '' ? @% : '[No Name]'
"endfunction
"
"let g:lightline.component_type = {
"\   'coc_error'        : 'error',
"\   'coc_warning'      : 'warning',
"\   'coc_info'         : 'tabsel',
"\   'coc_hint'         : 'middle',
"\   'coc_fix'          : 'middle',
"\ }
"
"function! s:lightline_coc_diagnostic(kind, sign) abort
"	let info = get(b:, 'coc_diagnostic_info', 0)
"	if empty(info) || get(info, a:kind, 0) == 0
"		return ''
"	endif
"	return printf('%s %d', a:sign, info[a:kind])
"endfunction
"function! LightlineCocErrors() abort
"	return s:lightline_coc_diagnostic('error', 'E')
"endfunction
"function! LightlineCocWarnings() abort
"	return s:lightline_coc_diagnostic('warning', 'W')
"endfunction
"function! LightlineCocInfos() abort
"	return s:lightline_coc_diagnostic('information', 'I')
"endfunction
"function! LightlineCocHints() abort
"	return s:lightline_coc_diagnostic('hints', 'H')
"endfunction
"
"autocmd User CocDiagnosticChange call lightline#update()
"

