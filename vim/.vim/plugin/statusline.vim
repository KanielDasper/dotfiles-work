" Statusline
" %F – Display the full path of the current file.
" %M – Modified flag shows if file is unsaved.
" %Y – Type of file in the buffer.
" %{&fenc} - file encoding.
" %R – Displays the read-only flag.
" %b – Shows the ASCII/Unicode character under cursor.
" 0x%B – Shows the hexadecimal character under cursor.
" %l/%L – Display the line number/total line number.
" %c – Display the column number.
" %p%% – Show the cursor percentage from the top of the file.
 
" statusline colors
hi NColor ctermbg=4 ctermfg=0
hi NSColor ctermbg=8 ctermfg=4
hi IColor ctermbg=1 ctermfg=0
hi ISColor ctermbg=8 ctermfg=1
hi RColor ctermbg=11 ctermfg=0
hi RSColor ctermbg=8 ctermfg=11
hi VColor ctermbg=5 ctermfg=0
hi VSColor ctermbg=8 ctermfg=5
hi CColor ctermbg=2 ctermfg=0
hi CSColor ctermbg=8 ctermfg=2
 
hi RightColor ctermbg=0 ctermfg=4
hi RightSepColor ctermbg=8 ctermfg=0
 
set laststatus=2    " toujours afficher la Statusline
set statusline=     " nettoyer la statusline au lancement
" status mode indicator airline style -- demande 'colorscheme nord'
set statusline+=%#NColor#%{(mode()=='n')?'\ \ [N]\ ':''}\%#NSColor#%{(mode()=='n')?'\\':''}
set statusline+=%#IColor#%{(mode()=='i')?'\ \ [I]\ ':''}\%#ISColor#%{(mode()=='i')?'\\':''}
set statusline+=%#RColor#%{(mode()=='R')?'\ \ [R]\ ':''}\%#RSColor#%{(mode()=='R')?'\\':''}
set statusline+=%#VColor#%{(mode()=='v')?'\ \ [V]\ ':''}\%#VSColor#%{(mode()=='v')?'\\':''}
set statusline+=%#CColor#%{(mode()=='c')?'\ \ [C]\ ':''}\%#CSColor#%{(mode()=='c')?'\\':''}
set statusline+=%#StatusLine#                     " back 2 default
set statusline+=\ [%{&fenc}]\ %y\ [%1.25F]\ %m    " status left
set statusline+=\ %#IColor#%r\%#StatusLine#       " red bg 4 RO
set statusline+=%=%#RightSepColor#\%#RightColor# " status right
set statusline+=\ [%l/%L]\ [%c]\ [%p%%]
