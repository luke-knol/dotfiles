"
" Go
" 

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" disable fmt on save
" let g:go_fmt_autosave = 0

nnoremap <s-F5> :!go install tools/tellme/cmd/tellme<cr>
noremap <F4> :w<CR>:GoRun<CR>
noremap <F5> :w<CR>:!go vet -composites=false %:p:h<CR>

map <F6> :w<CR>:!tclient "gk; echo DONE"<CR><CR>
cabbr tt w<CR>:!tclient "gk; echo DONE"<CR><CR>

noremap <F7> :GoDoc<CR>
noremap <C-]> :GoDef<CR>
noremap <C-\> :ta <C-r><C-w><CR>

map \d :GoDescribe<CR>
map \i :GoImplements<CR>
map \r :GoReferrers<CR>

noremap <Leader>ln :s/Println/Printf<CR>

noremap <Leader>gk :VimuxRunCommand "ginkgo"<cr>
noremap <Leader>gkr :VimuxRunCommand "ginkgo -r"<cr>

map <F8> :VimuxRunCommand "figlet OOOOOPS"<cr>

map <leader>x I//XXX <esc>j0

" shortcut to edit this file:
cabbr govimrc e ~/.vim/after/ftplugin/go.vim
cabbr gosnip e ~/.vim/bundle/vim-snippets/snippets/go.snippets

cabbr go_def_guru let g:go_def_mode = 'guru'
cabbr go_def_godef let g:go_def_mode = 'godef'


au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gr <Plug>(go-referrers)
