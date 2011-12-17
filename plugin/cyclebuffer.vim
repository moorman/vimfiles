" CycleBuffer - Cycle Through Buffers 
"               Borrowed from MinBufExplorer
"
" Move to next or previous buffer in the current window. If there 
" are no more modifiable buffers then stay on the current buffer.
" can be called with no parameters in which case the buffers are
" cycled forward. Otherwise a single argument is accepted, if 
" it's 0 then the buffers are cycled backwards, otherwise they
" are cycled forward.
"
function! <SID>CycleBuffer(forward)

  " Fix EM : buffer niet wijzigen voor nerdtree en andere 
  " unlisted buffers. 
  if (winbufnr(2) != -1) && (&buflisted == 0)
    wincmd p  
  endif
  
  " Change buffer
  if (a:forward == 1)
    bn!
  else
    bp!
  endif

endfunction

" If we have enabled <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
if g:ctrlTabCycleBuffer
  noremap <C-TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
  noremap <C-S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
endif
