nnoremap - ddp 
nnoremap _ ddkP 
nnoremap <leader>cn  :edit $MYVIMRC<cr> 
nnoremap <leader>cnh :split $MYVIMRC<cr> 
nnoremap <leader>cnv :vsplit $MYVIMRC<cr> 
nnoremap <leader>scn :source $MYVIMRC<cr>
nnoremap <C-D> :term<CR>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>w <C-W>w
inoremap jj <esc>

"Wrappings - ", ', (, [, {
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel

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
