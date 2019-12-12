
" Jump to ruby snippets editor
map <leader>es :e ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<CR>


" Vim Rails / Rspec mappings:
" (alternate file:)
map <leader>a :A<CR>
map <F3> :A<CR>
map <leader>gv :Eview<CR>
map <leader>gc :Econtroller<CR>

map <leader>P Obinding.pry<esc>
map <leader>d ,/:s/^\s*#/# XXX <CR>

" rspec mappings:
map <leader>rf :w<CR>:call RunCurrentSpecFile()<CR>:copen 20<CR>:AnsiEsc<CR>
map <leader>rn :w<CR>:call RunNearestSpec()<CR>:copen 20<CR>:AnsiEsc<CR>
map <leader>rr :w<CR>:call RunLastSpec()<CR>:copen 20<CR>:AnsiEsc<CR>
map <leader>ra :w<CR>:call RunAllSpecs()<CR>:copen 20<CR>:AnsiEsc<CR>
map <leader>re :w<CR>:!ruby %<CR>
map <leader>rz :w<CR>:!zeus runner %<CR>
" Redundant shortcuts from old habits:
map <leader>R :w<CR>:call RunNearestSpec()<CR>:copen 20<CR>:AnsiEsc<CR>
map <F4> :w<CR>:call RunLastSpec()<CR>:copen 20<CR>:AnsiEsc<CR>
map <F5> :w<CR>:!ruby %<CR>
map <F6> :w<CR>:!ruby -c %<CR>
" To use Dispatch and Zeus together:
" let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec --tty --color {spec}"

" neovim 
"tnoremap <Esc> <c-\><c-n> 
