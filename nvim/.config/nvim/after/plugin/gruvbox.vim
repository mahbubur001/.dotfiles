hi Comment cterm=italic

set background=dark
colorscheme gruvbox


set termguicolors                       " Make theme look nice in the terminal
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection='0'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

highlight ColorColumn ctermbg=0 guibg=grey
highlight Normal guibg=none
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f
