" STATUSLINE
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=git:\ %{GitStatus()}
set statusline+=\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ 
set laststatus=2

