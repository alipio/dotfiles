" Verbatim matching for *.
function! misc#search() abort
  let regsave = @@
  normal! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = regsave
endfunction

" Emacs-like fold text.
function misc#fold_text_emacs() abort
    return getline(v:foldstart) . '...'
endfunction

" Capture output of any command in a new window.
function! misc#scratch(cmd) abort
  let more = &more
  set nomore
  try
    let lines = 1
    redir => lines
    silent execute a:cmd
  finally
    redir END
    let &more = more
  endtry
  noautocmd new
  setlocal buftype=nofile bufhidden=hide noswapfile
  silent put =lines
  1
  nnoremap <buffer> q :q<cr>
endfunction

"
" Make <tab> a little bit more useful. Stolen from junegunn.
"
function! s:can_complete(func, prefix)
  if empty(a:func) || a:func(1, '') < 0
    return 0
  endif
  let result = a:func(0, matchstr(a:prefix, '\k\+$'))
  return !empty(type(result) == type([]) ? result : result.words)
endfunction

function! misc#tab_complete()
  if pumvisible()
    return "\<c-n>"
  endif
  let line = getline('.')
  let col = col('.') - 2
  if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k'
    return "\<tab>"
  endif
  let prefix = expand(matchstr(line[0:col], '\S*$'))
  if prefix =~ '^[~/.]'
    return "\<c-x>\<c-f>"
  endif
  if !empty(&completefunc) && s:can_complete(function(&completefunc), prefix)
    return "\<c-x>\<c-u>"
  endif
  if !empty(&omnifunc) && s:can_complete(function(&omnifunc), prefix)
    return "\<c-x>\<c-o>"
  endif
  return "\<c-n>"
endfunction
