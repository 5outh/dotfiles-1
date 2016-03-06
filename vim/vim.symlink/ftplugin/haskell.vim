let g:haskell_indent_if = 3
let g:haskell_indent_case = 5
let g:haskell_indent_let = 4
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

nnoremap <Leader>hs :%!stylish-haskell<CR>

nnoremap <buffer> <Leader>t :HdevtoolsType<CR>
nnoremap <buffer> <Leader>T :GhcModTypeInsert<CR>
nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
nnoremap <buffer> <Leader>i :HdevtoolsInfo<CR>
nnoremap <buffer> <Leader>f :GhcModSplitFunCase<CR>

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc

syntax match hsNiceOperator "\<forall\>" display conceal cchar=∀

syntax match hsNiceOperator "`elem`" conceal cchar=∈
syntax match hsNiceOperator "`notElem`" conceal cchar=∉

syntax match hsStructure
  \ "()"
  \ display conceal cchar=∅

syntax match hsStructure
  \ '\s=>\s'ms=s+1,me=e-1
  \ display conceal cchar=⇒

syntax match hsOperator
  \ '\s\~>\s'ms=s+1,me=e-1
  \ display conceal cchar=⇝

syntax match hsOperator
  \ '\s>>>\s'ms=s+1,me=e-1
  \ display conceal cchar=↠

syntax match hsOperator
  \ '\s<<<\s'ms=s+1,me=e-1
  \ display conceal cchar=↞

syntax match hsStructure
  \ '\s-<\s'ms=s+1,me=e-1
  \ display conceal cchar=↢

syntax match hsStructure
  \ '\s>-\s'ms=s+1,me=e-1
  \ display conceal cchar=↣

syntax match hsStructure
  \ '\s-<<\s'ms=s+1,me=e-1
  \ display conceal cchar=⇺

syntax match hsNiceOperator "\<not\>" conceal cchar=¬
