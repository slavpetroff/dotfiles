" Pathogen load
filetype off

set autoindent
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
" -----------------

" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fisadev/vim-isort'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" -----------------

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" -----------------

" Turn on line numbering
set nu
" -----------------

" Display all matching files when we tab complete
set wildmenu
" -----------------

" Display the typed command
set showcmd
" -----------------

" Colorschema
colorscheme space-vim-dark
hi Comment cterm=italic

"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235
let g:space_vim_dark_background = 236
color space-vim-dark
" -----------------

" Set relativenumber
set relativenumber
" -----------------

" Autoformat upon vim exit
noremap <F4> :Autoformat<CR>
au BufWrite * :Autoformat
" -----------------

" Formatprograms
let g:formatter_yapf_style = 'facebook'
" -----------------

" Sort imports
let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = '<C-i>'
" -----------------

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" -----------------

" Autocompleter
" let g:completor_python_binary = '/usr/local/lib/python3.5/dist-packages/jedi'

" Tab key for autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" -----------------

" Hide pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" -----------------

" Enable folding with the spacebar
nnoremap <space> za
" -----------------

" UTF-8 Encoding
set encoding=utf-8
" -----------------

" Easy motion setups
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" -----------------

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" " or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
"
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" -----------------

" Set powerline
set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim/
set laststatus=2
" -----------------

" Set rename the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" -----------------

" Tmux config
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Up> :TmuxNavigateUp<cr>
nnoremap <silent> <Right> :TmuxNavigateRight<cr>
" -----------------

" Jedi-vim
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<C-leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#use_tabs_not_buffers = 1
" -----------------

" Highlight the word under the cursor
autocmd CursorMoved * exe printf('match Visual /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" -----------------

" Remape CAPS-LOCK to ESCAPE
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
" -----------------
