" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make "set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Interface optimization
set nu
set ai
set cursorline
set tabstop=4
set shiftwidth=4
set autoindent
set clipboard=unnamedplus

set guifont=consolas:h12 " for windows
colorscheme slate

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar</span>

augroup relative_numbser
	autocmd!
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertLeave * :set relativenumber
augroup END

set encoding=utf-8
set linebreak
set wrapmargin=2
set laststatus=2
set term=xterm-256color
set t_Co=256

set noerrorbells
set visualbell
set autoread
set history=500
set nobackup

set wildmenu
set wildmode=longest:list,full

" serch
set hlsearch
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Key Mapping
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
map jk <Esc>
vmap jk <Esc>
map! jk <Esc>
nunmap jk
" These create newlines like o and O but stay in normal mode
nmap zj o<Esc>k
nmap zk O<Esc>j

hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE

" Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.vim/bundle/tagbar
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " 插件管理器本人
Plugin 'mattn/emmet-vim' " 快速插入html
Plugin 'tpope/vim-surround' " 快速包圍
Plugin 'chrisbra/Colorizer' " 顏色提示
Plugin 'scrooloose/nerdtree' " 樹形目錄
Plugin 'jistr/vim-nerdtree-tabs' " 樹型目錄強化
Plugin 'jiangmiao/auto-pairs' " 自動補全對稱符
Plugin 'mkitt/tabline.vim' " tab頁籤
Plugin 'itchyny/lightline.vim' " 下方狀態列表
Plugin 'scrooloose/nerdcommenter' " 快速註解
Plugin 'joshdick/onedark.vim' " vim 主題
Plugin 'Glench/Vim-Jinja2-Syntax' " python Jinja 模塊語法高亮
Plugin 'Valloric/YouCompleteMe' " 補全提示
" vim 需要支持python
" 安裝方式: cd ~/.vim/bundle/YouCompleteMe &&  python3 install.py --ts-completer
Plugin 'pelodelfuego/vim-swoop'
Plugin 'terryma/vim-expand-region'
Plugin 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plugin 'majutsushi/tagbar' 

call vundle#end()            " required
filetype plugin indent on    " required

"" set leader key
"nnoremap <SPACE> <Nop>
"map <Space> <Leader>

" set WhichKey
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>"

" set Swoop
nmap <Leader>ss :call Swoop()<CR>

" set region_expend
nmap <Leader>v <Plug>(expand_region_expand)
nmap <Leader>V <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" set NERDTree
nmap <Leader>0 :NERDTree<CR>

" set Tagbar
nmap <Leader>bi :TagbarToggle<CR>

" set some function
nmap <Leader>fs :w<CR>
nmap <Leader>qq :qa<CR>
nmap <Leader>qs :wq<CR>
nmap <C-L> z.
imap <C-L> <Esc>z.i

