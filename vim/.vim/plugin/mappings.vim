" <leader> + <cr> to remove highlight
nnoremap <silent> <leader><cr> :noh<cr>
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

" ipython-shell
nnoremap <localleader>ss :call StartPyShell()<CR>
noremap <localleader>sk :call StopPyShell()<CR>
" code execution
nnoremap <leader>r :call PyShellSendLine()<CR>
vnoremap <leader>r :call PyShellSendLine()<CR>

" LSP config
nnoremap <leader>dd :LspDefinition<cr>
nnoremap <leader>dn :LspNextDiagnostic<cr>
nnoremap <leader>dp :LspPreviousDiagnostic<cr>
nnoremap <leader>df :LspReferences<cr>
nnoremap <leader>dr :LspRename<cr>
nnoremap <leader>ds :LspStopServer<cr>
nnoremap <leader>dp :LspPeekDefinition<cr>
nnoremap <leader>da :LspCodeAction<cr>
nnoremap <leader>dh :LspHover<cr>
nnoremap <leader>df :LspDocumentFormat<cr> 
nnoremap <leader>dd :LspDefinition<cr>
