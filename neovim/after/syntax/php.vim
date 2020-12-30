" syn match phpVarSelectorThis "\$this" contained containedin=phpIdentifier
"
" syn keyword phpInclude namespace contained nextgroup=phpUseClass skipwhite skipempty
" syn keyword phpType self contained nextgroup=phpIdentifier skipwhite skipempty
"
" syn match phpMethodsVar "\%(->\|::\%($\)\@!\)\s*\h\w*\s*("me=e-1 skipwhite skipempty contained contains=phpMemberSelector,phpFunction display containedin=phpStringDouble
