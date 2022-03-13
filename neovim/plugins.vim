call plug#begin('~/.config/nvim/autoload/plugged')

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" File Explorer
	Plug 'scrooloose/NERDTree'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'
	" Nord Theme
	Plug 'shaunsingh/nord.nvim'
	" Neovim Lua
	Plug 'nvim-lua/plenary.nvim'
	" COC for autocompletion
	Plug 'neoclide/coc.nvim', {'branch' : 'release'}
	" Neogit
	Plug 'TimUntersberger/neogit'
	" NVim Autosave
	Plug 'Pocco81/AutoSave.nvim'
	" Gruvbox theme
	Plug 'morhetz/gruvbox'
	" Gruvbox Material theme
	Plug 'sainnhe/gruvbox-material'
	" Alduin theme
	Plug 'alessandroyorba/alduin'
	" Everforest theme
	Plug 'sainnhe/vim-color-forest-night'
	" Palenight theme
	Plug 'drewtempelmeyer/palenight.vim'
	" JDH plugins
	Plug 'vim-airline/vim-airline'
	Plug 'wlangstroth/vim-racket'
	Plug 'sheerun/vim-polyglot'
	Plug 'rust-lang/rust.vim'
	Plug 'preservim/tagbar'
	Plug 'universal-ctags/ctags'
	Plug 'luochen1990/rainbow'
	Plug 'vim-syntastic/syntastic'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-surround'
	Plug 'tommcdo/vim-lion'
	Plug 'Shirk/vim-gas'
	Plug 'ntpeters/vim-better-whitespace'
	" Better terminal integration
	Plug 'numToStr/FTerm.nvim'
	" Multiple Cursor support
	Plug 'terryma/vim-multiple-cursors'
	" Neogit
	Plug 'TimUntersberger/neogit'

call plug#end()
