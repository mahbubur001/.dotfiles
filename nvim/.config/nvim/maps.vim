let mapleader = " "

" ------Standard Bindings------
nnoremap <leader>n :nohlsearch<cr>
" ------ Nvim binding ---------
nnoremap <C-e> :NvimTreeToggle<cr>
nnoremap - :NvimTreeFindFile<cr>
nnoremap <leader><CR> :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>x :bd<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move to previous/next
nnoremap <silent> <TAB> :BufferNext<CR>
nnoremap <silent> <S-TAB> :BufferPrevious<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

nnoremap <leader>F :Neoformat prettier<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>                  " Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>                " Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>                   " <TAB>: completion.
imap    jj <Esc>                   " <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" -----Basic AutoCmd-----
augroup MAHBUBUR
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell
    autocmd BufRead,BufNewFile *.tex set filetype=tex
    autocmd FileType tex,latex,markdown setlocal spell spelllang=en_au
    autocmd InsertEnter * norm zz
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
