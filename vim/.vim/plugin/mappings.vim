" <leader> + <cr> to remove highlight
nnoremap <CR> :noh<CR><CR>:<backspace>

" Yank and paste to and from clipboard when togglepaste mode is enabled
nnoremap <leader>pp :call TogglePasteMode()<cr>

nnoremap <leader>cn  :edit $MYVIMRC<cr> 
nnoremap <leader>cnh :split $MYVIMRC<cr> 
nnoremap <leader>cnv :vsplit $MYVIMRC<cr> 
nnoremap <localleader>. :source $MYVIMRC<cr>
nnoremap <C-D> :term<CR>
inoremap jj <esc>
nnoremap - ddp 
nnoremap _ ddkP 

" Emacs navigation for commandline
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

"-- AUTOCLOSE NATIVE CONFIG
      "autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" ipython-shell
nnoremap <localleader>ss :call StartPyShell()<CR>
noremap <localleader>sk :call StopPyShell()<CR>
" code execution
nnoremap <leader>r :call PyShellSendLine()<CR>
vnoremap <leader>r :call PyShellSendLine()<CR>
