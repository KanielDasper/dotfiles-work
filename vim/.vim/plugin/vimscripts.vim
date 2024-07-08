" Vim Scripts
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=2
	endif
endfunction

nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0

function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_return_to_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction

let g:paste_mode = 0

" Function to toggle paste mode
function! TogglePasteMode()
  if g:paste_mode == 0
    let g:paste_mode = 1
    " Set mappings for paste mode
    vnoremap <leader>y "+y
    vnoremap <leader>p "+p
    echo "Paste mode enabled"
  else
    let g:paste_mode = 0
    " Unset mappings for normal mode
    vunmap <leader>y
    vunmap <leader>p
    echo "Paste mode disabled"
  endif
endfunction

" Normal mode mapping to toggle paste mode
nnoremap <leader>pp :call TogglePasteMode()<CR>

