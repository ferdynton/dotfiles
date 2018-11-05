" No compatibility with vi, unleash the power
set nocompatible

" Disable detection of file type
filetype off

" Set up Pathogen
execute pathogen#infect()

" Airline
let g:airline_extensions = []

" Solarized theme
syntax enable
set background=dark
colorscheme solarized

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

set number
set colorcolumn=80
highlight ColorColumn ctermbg=24
set hlsearch
set ignorecase
set smartcase
set spell spelllang=en_us

" Show trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Auto delete trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" CtrlP
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -oc --exclude-standard']
set wildignore+=*/tmp/*,*/node_modules/*,*/log/*,*/vendor/*

" NERDTree customization and configuration
noremap <C-m> :NERDTreeFind<CR>
" TODO: I want C-m to be open nerdtree in all, plus find current file OR close
" all, including while within nerdtree
let g:NERDTreeMapJumpNextSibling = '<Esc>'
let g:NERDTreeMapJumpPrevSibling = '<Esc>'

" My own custom mappings for tabs and panes
noremap <C-j>  gT
noremap <C-k>  gt
noremap <C-e>  <C-w><C-w>
noremap <C-u>  :Gblame<CR>

" Allow mouse manipulation
set mouse=a

set clipboard=unnamed

" Disable parenthesis (and similars) parent highlight match for improved
" performance
let loaded_matchparen = 1

" Copy filename into clipboard
noremap <silent> <C-x> :let @+ = expand("%") <CR>

" Refresh Ctags - Not working properly yet :(
noremap <silent> <C-t> :!ctags -e --exclude=.git --exclude='*.log' -R * `bundle show --paths` <CR><CR>

abbr pry require 'pry'; binding.pry<Esc>
abbr frozes # frozen_string_literal: true<Esc>

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
" This is for cron to work
" http://vim.wikia.com/wiki/Editing_crontab
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Hook up the ack plugin to the Silver Searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag LAck

" Fugitive's status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vim-ruby config
let g:ruby_indent_assignment_style = 'variable'

" Rust auto formatting
let g:rustfmt_autosave = 1

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_fix_on_save = 1

let g:markdown_fold_style = 'nested'
autocmd Syntax markdown normal zR
