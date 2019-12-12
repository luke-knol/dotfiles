execute pathogen#infect()

syntax on
filetype plugin indent on    " required

"
" Croz personal preferences:
"
set nofoldenable

if $TERMINALBG == 'LIGHT'
  colorscheme Tomorrow
else
  colorscheme vividchalk
  highlight Search term=reverse ctermbg=4 gui=undercurl guifg=green guibg=white guisp=Blue
endif

let mapleader=","
set mouse=a
cabbr W w 
noremap <leader>o :only<CR>
noremap <leader>v :vsplit<CR><C-W><C-W>
noremap <leader>- :split<CR><C-W><C-W>
map <C-n> :bn<CR>
map <C-p> :bp<CR>
map <F2> :w<CR>
noremap <leader>w :Bclose<cr>
noremap <leader>q :bd<cr>
noremap <leader>/ :TComment<CR>
set autoindent
set bs=2
" Clipboard integration:

set completeopt=longest,menuone
set expandtab

" set hidden
set ignorecase
set incsearch
set nocompatible
"set nohlsearch
set hlsearch
" set nowrap
set number
set ruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartcase
set smartindent
set smarttab
set wildmenu
set wildmode=longest,list,full
if $TMUX == ''
  set clipboard=unnamed
endif

map <f1> :tabnew<cr>
cabbr tn0 tabnew<CR>:tabmove 0<CR>
cabbr tm tabmove<CR>
cabbr tm0 tabmove 0<CR>

map <s-f8> <Plug>ColorstepPrev
map <s-f9> <Plug>ColorstepNext

"
" PT (platinum searcher)
"
set grepprg=pt\ --smart-case\ --nogroup\ --nocolor
command! -nargs=+ -complete=file -bar Pt silent! grep! <args>|cwindow|redraw!
nnoremap <leader>f :Pt ''<LEFT>
nnoremap <leader>gf :Pt '<c-r><c-w>'<cr>
" JARED HACK: opens tabs for Quick Fix hits: autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T

"
" FZF fuzzy finder
"
set rtp+=~/.fzf
map <leader>t :FZF!<CR>



" Turn on/off search highlighting
noremap <leader>hlo :set hlsearch<CR> 
noremap <leader>hlf :set nohlsearch<CR> 
noremap <leader>nhl :set nohlsearch<CR> 

" 
" NERDTree
"
"let g:NERDTreeDirArrows=0
map <leader>nn :NERDTreeToggle<CR>
map <leader>nm :NERDTreeMirror<CR>
map <leader>nf :NERDTreeFind<CR>

"
" CtrlP (fuzzy file finder)
"
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" let g:ctrlp_max_depth=40
" let g:ctrlp_max_files=0
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_working_path_mode = ''
" map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>, :CtrlPBuffer<CR>
set wildignore+=tags,*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*/public/*,*/node_modules/*,*/log/*,*/venv/*,*.pyc,*.a
" set wildignore+=*/.hg/*,*/.svn/*,*/tmp/*,*/public/*,*/node_modules/*,*/log/*,*/venv/*,*.pyc

"
" Snip file: (heavy-handed cut-n-paste)
"
" ~/snip is a junk file; call it a customized clipboard
" Write to snip.  Either uses current visual selection, or entire buffer
"
noremap  \ws :w! ~/snip<cr>
" Read contents of snip into current buffer
noremap  \rs :r ~/snip<cr>
" Edit the snip file
noremap  \es :e ~/snip<cr>
" Append to the snip file
noremap  \as :w! >> ~/snip<cr>



" mustache handlebars abbreviations
let g:mustache_abbreviations = 1

"
" Vimux
"
" let g:VimuxOrientation = "h"
" let g:VimuxHeight = "40"
" let g:VimuxWidth = "50"
" let maplocalleader = ","
" map <LocalLeader>p :VimuxPromptCommand<CR>
" map <LocalLeader>xc :VimuxPromptCommand<CR>
" map <LocalLeader>xr :VimuxRunLastCommand<CR>
" map <LocalLeader>xq :VimuxCloseRunner<CR>
" map <LocalLeader>xx :VimuxInterruptRunner<CR>

set modeline
set modelines=5

let g:markdown_enable_spell_checking = 0

let g:gist_api_url = 'https://github.llnw.net/api/v3'

" Experimenting with session management
cabbr ses source ~/.vimsession
cabbr wses mksession! ~/.vimsession

" for convenient paragraph reformatting:
map ,rf vipgqj

map <leader>p :set paste<CR>
map <leader>np :set nopaste<CR>
map <leader>so :set syn=off<CR>

" magic! generate a github link to the current file/line
nnoremap <leader>gl :execute ":!glink.sh" bufname('%') line('.')<CR>

" let g:go_def_mode = 'guru'
let g:go_def_mode = 'godef'

"
" VIMSCRIPT tinkering
"

" prints a copy of the given string prepended with a line number.  works with ranges.
" function Mynumber(arg)
"   echo line(".") . " " . a:arg
" endfunction

function! Showpos()
  let l:offset = eval(line2byte(line("."))+col(".") - 1)
  let l:fullpath = expand("%:p")
  echo "line: " . line('.') . " col: " . col('.') . " offset: " . l:offset . " file: " . l:fullpath
endfunction
nnoremap ; :call Showpos()<cr>

function! GoTellme()
  let l:offset = eval(line2byte(line("."))+col(".") - 1)
  let l:fullpath = expand("%:p")
  echo "line: " . line('.') . " col: " . col('.') . " offset: " . l:offset . " file: " . l:fullpath
  execute "!tellme --file " . l:fullpath . " --offset " . l:offset
endfunction
nnoremap <F3> :call GoTellme()<cr>

noremap <F3> :w<CR>:!go vet %<CR>

augroup gzip
 autocmd!
 autocmd BufReadPre,FileReadPre *.gz set bin
 autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
 autocmd BufReadPost,FileReadPost   *.gz set nobin
 autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
 autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
 autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
 autocmd FileAppendPre      *.gz !gunzip <afile>
 autocmd FileAppendPre      *.gz !mv <afile>:r <afile>
 autocmd FileAppendPost     *.gz !mv <afile> <afile>:r
 autocmd FileAppendPost     *.gz !gzip <afile>:r
augroup END

