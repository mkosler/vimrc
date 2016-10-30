"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'neomake/neomake'                                            " Neomake
Plug '29decibel/codeschool-vim-theme'                             " Code school colorscheme
Plug 'jnurmine/Zenburn'                                           " Zenburn colorscheme
Plug 'leafgarland/typescript-vim'                                 " TypeScript syntax files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }       " Keyword completion
Plug 'SirVer/ultisnips'                                           " Snippets engine
Plug 'honza/vim-snippets'                                         " Snippets
Plug 'tpope/vim-commentary'                                       " Commentor
Plug 'ARM9/snes-syntax-vim'                                       " SNES syntax

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Setting
" Colors

syntax enable                      " enable syntax processing
set termguicolors
colorscheme zenburn                

" Spaces and tabs

set smarttab
set shiftwidth=2
set tabstop=2                      " number of visual spaces per TAB
set softtabstop=2                  " number of spaces in tab when editing
set expandtab                      " tabs are spaces

" UI Config

set number                         " show line numbers
set showcmd                        " show command in bottom bar
set cursorline                     " highlight current line
filetype indent on                 " load filetype-specific indent files
set wildmenu                       " visual autocomplete for command menu
set lazyredraw                     " redraw only when we need to
set showmatch                      " highlight matching [{()}]

" Searching

set incsearch                      " search as characters are entered
set hlsearch                       " highlight matches

" Deoplete

let g:deoplete#enable_at_startup=1 " use deoplete

" Ultisnips

let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Keybindings

" Turn off search highlight
nnoremap <leader><space> :nohl<CR>

" Open/load .nvimrc
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>es :source ~/.config/nvim/init.vim<CR>

" Fuzzy search current directory
nnoremap <leader>f :FZF<CR>

"" Neomake
" Run Neomake
nnoremap <leader>nm :Neomake<CR>

" Autorun Neomake on save
autocmd! BufWritePost * Neomake

" Automatically open error list if errors exists
let g:neomake_open_list = 2

au BufNewFile,BufRead *.asm,*.inc set filetype=snes
au FileType snes setlocal commentstring=;\ %s
