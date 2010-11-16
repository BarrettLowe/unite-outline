"=============================================================================
" File    : autoload/unite/sources/outline/defaults/html.vim
" Author  : h1mesuke <himesuke@gmail.com>
" Updated : 2010-11-16
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================

" Default outline info for HTML

function! unite#sources#outline#defaults#html#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
      \ 'heading' : '<[hH][1-6][^>]*>',
      \ }

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  let level = str2nr(matchstr(a:heading_line, '<[hH]\zs[1-6]\ze[^>]*>'))
  let lines = a:context.lines | let h = a:context.heading_index
  let text = unite#sources#outline#join_to(lines, h, '</[hH]'.level.'[^>]*>')
  let text = substitute(text, '\s*\n\s*', ' ', 'g')
  let text = substitute(text, '<[^>]*>', '', 'g')
  let text = substitute(text, '^\s*', '', '')
  return unite#sources#outline#indent(level) . "h" . level. ". " . text
endfunction

" vim: filetype=vim