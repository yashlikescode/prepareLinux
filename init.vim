set number
set relativenumber
set mouse=a
set autoindent
set tabstop=4
set shiftwidth=4


call plug#begin()

Plug 'https://github.com/preservim/nerdtree'

call plug#end()

let g:NERDTreeDirArrowExpandable=">"
let g:NERDTreeDirArrowCollapsible="v"


" nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
