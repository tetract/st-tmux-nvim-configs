" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	" coc extensions
	let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
	"------------------------ VIM TSX ------------------------
	" by default, if you open tsx file, neovim does not show syntax colors
	" vim-tsx will do all the coloring for jsx in the .tsx file
	"Plug 'ianks/vim-tsx'
	"------------------------ VIM TSX ------------------------
	" by default, if you open tsx file, neovim does not show syntax colors
	" typescript-vim will do all the coloring for typescript keywords
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'HerringtonDarkholme/yats.vim'
	"Plug 'leafgarland/typescript-vim'
	Plug 'maxmellon/vim-jsx-pretty'
	"------------------------ Airline ------------------------
	Plug 'vim-airline/vim-airline'
	"------------------------ Prettier -----------------------
	command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

	"------------------------ THEME ------------------------
	" most importantly you need a good color scheme to write good code :D
	Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
	Plug 'dikiaap/minimalist'
	set t_Co=256
	syntax on
"------------------------ TreeSitter -----------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"------------------------NERD-TREE---------------------
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" --------------------File-search-------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" - down / up / left / right
let g:fzf_layout = { 'up': '20%' }
" -----------------------Git-------------------------
Plug 'lewis6991/gitsigns.nvim'
" -----------------------autopairs-------------------
Plug 'windwp/nvim-autopairs'
" == VIMPLUG END ================================
call plug#end()
" -----------------------Integrated-Terminal---------

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" ----------------------Alias-----------------------
" ----------------------Colorscheme-----------------
"colorscheme embark
colorscheme minimalist
" ----------------------Switching-windows-----------
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" == LUA ========================================
lua require("nvim-autopairs").setup{}
lua require("gitsigns").setup()
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
