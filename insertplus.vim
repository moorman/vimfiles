function ToggleInsertex
	if s:on == 0
	  s:on = 1
	  imap <C-w> 	
	else
		s:on = 0
	endif	
endfunction
