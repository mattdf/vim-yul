" Vim syntax file
" Language: Yul
" Maintainer: Matthew Di Ferrante
" Latest Revision: 27 June 2021

if exists("b:current_syntax")
    finish
end

"syn match    yulIdentifier        /[a-zA-Z_$][0-9a-zA-Z_$]*/

syn match    yulFuncCall          /\zs[a-zA-Z_$][0-9a-zA-Z_$]*\ze(.*)/


syn keyword EVMDialect stop add sub mul div sdiv mod smod exp not lt gt slt sgt eq iszero and or xor byte shl shr sar addmod mulmod signextend keccak256 pc pop mload mstore mstore8 sload sstore msize gas address balance selfbalance caller callvalue calldataload calldatasize calldatacopy codesize codecopy extcodesize extcodecopy returndatasize returndatacopy extcodehash create create2 call callcode delegatecallcode staticcall return revert selfdestruct invalid log0 log1 log2 log3 log4 chainid origin gasprice blockhash coinbase timestamp number difficulty gaslimit

syn keyword ControlFlow          for while
syn keyword Control              if case switch default break continue
syn keyword Component            code
syn keyword Object               object
syn keyword Lang                 let leave

syn match AssignNew              /:=/
syn match Assign                 /=/

syn match   yulFuncArgCommas     contained ','
syn region  yulFuncReturns       contained matchgroup=yulReturnZone start='->' end='{' contains=yulFuncArgCommas skipwhite skipempty

syn match   yulFuncName          contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=yulFuncArgs skipwhite
syn region  yulFuncArgs          contained matchgroup=yulFuncParens start='(' end=')' contains=yulFuncArgCommas nextgroup=yulFuncReturns keepend skipwhite skipempty

syn match yulFunction            /\<function\>/ nextgroup=yulFuncName,yulFuncArgs skipwhite
syn match yulNumber              /\<-\=\d\+L\=\>/
syn match yulHex                 /0x[a-fA-F0-9]\+/

"syn region yulBlock              start="{" end="}" fold transparent contains=ControlFlow,Component,EVMDialect,Control

syn region  yulString            start=+"+  skip=+\\\\\|\\$"+  end=+"+
syn region  yulString            start=+'+  skip=+\\\\\|\\$'+  end=+'+

" Comment
syn keyword yulCommentTodo       TODO FIXME XXX TBD contained
syn region  yulLineComment       start=+\/\/+ end=+$+ contains=yulCommentTodo,@Spell
syn region  yulLineComment       start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ contains=yulCommentTodo,@Spell fold
syn region  yulComment           start="/\*"  end="\*/" contains=yulCommentTodo,@Spell fold

let b:current_syntax = "yul"

hi def link yulFuncCall     PreProc
"hi def link yulIdentifier   Normal

hi def link yulString       String
hi def link yulNumber       Constant
hi def link yulHex          Constant
hi def link ControlFlow     Repeat
hi def link Control         Conditional

hi def link yulFuncReturns  Identifier
hi def link yulFuncArgs     Identifier
hi def link yulFunction     Type
hi def link yulFuncName     Function

hi def link Object          Keyword
hi def link Component       Keyword
hi def link Lang            Keyword

hi def link EVMDialect      Special
hi def link Assign          Operator
hi def link AssignNew       Operator


hi def link yulCommentTodo  Comment
hi def link yulLineComment  Comment
hi def link yulComment      Comment
