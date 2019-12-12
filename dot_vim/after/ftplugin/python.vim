"
" Python (Crosby's makeshift addons)
" 

" disable fmt on save
" let g:go_fmt_autosave = 0

noremap <F5> :w<CR>:!python %<CR>
noremap <F6> :w<CR>:!nosetests -sv<CR>
noremap <F7> :!pydoc <cword><cr>

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
