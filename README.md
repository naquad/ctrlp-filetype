# CtrlP FileType

CtrlP extension for fuzzy-searching available file types.

## Prerequisites

[CtrlP](https://github.com/kien/ctrlp.vim) should be installed

## Usage

Plugin provides `CtrlPFileType` command which will
pop up a list of available file types.

Types are gathered from syntax files names.
That is plugin will look through all runtime pathes (`&rtp`)
looking for files matching `/syntax/*.vim` pattern.

To add own file types in your `.vimrc` you can do
```
let g:ctrlp_filetypes = {}

let g:ctrlp_filetypes['filetype'] = 'optional description'
" e.g

let g:ctrlp_filetypes['cpp'] = 'C++ source file'
let g:ctrlp_filetypes['eruby'] = 'Embedded Ruby'
let g:ctrlp_filetypes['conf'] = 'Configuration file'
```
