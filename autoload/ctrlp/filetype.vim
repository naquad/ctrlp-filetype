" =============================================================================
" File:           autoload/ctrlp/filetype.vim
" Description:    FileTypes CtrlP plugin. Allows quick setting of file type.
" =============================================================================

" To load this extension into CtrlP, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['filetype']
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'filetype',
"         \ 'other_extension',
"         \ 'one_more',
"         \ ]

if (exists('g:loaded_ctrlp_filetype') && g:loaded_ctrlp_filetype)
        \ || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_filetype = 1

if !exists('g:ctrlp_filetypes')
  let g:ctrlp_filetypes = {}
endif

for path in split(&rtp, '\\\@!,')
  for ftname in map(split(glob(path . '/syntax/*.vim'), '\r\?\n'), 'fnamemodify(v:val, ":t:r")')
    if !has_key(g:ctrlp_filetypes, ftname)
      let g:ctrlp_filetypes[ftname] = ''
    endif
  endfor
endfor

call add(g:ctrlp_ext_vars, {
      \ 'init': 'ctrlp#filetype#init()',
      \ 'accept': 'ctrlp#filetype#accept',
      \ 'lname': 'filetype (char|digraph|hex|dec|official name)',
      \ 'sname': 'filetype',
      \ 'type': 'line',
      \ 'sort': 0,
      \ 'specinput': 0,
      \ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#filetype#init()
  let filetypes = items(g:ctrlp_filetypes)
  let maxlen = max(map(keys(g:ctrlp_filetypes), 'len(v:val)')) + 1
  return map(filetypes, 'join(v:val, repeat(" ", ' . maxlen . ' - len(v:val[0])))')
endfunction

function! ctrlp#filetype#accept(mode, str)
  call ctrlp#exit()
  exe "set ft=" . matchstr(a:str, '\(\S\+\)')
endfunction

function! ctrlp#filetype#id()
  return s:id
endfunction
