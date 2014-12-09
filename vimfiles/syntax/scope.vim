" Vim syntax file
" Language:	COSMOS Scope Script
" Maintainer:	Kyle Reed <kylereed@microsoft.com>
" Version: 0.1
" 
" $LastChangedDate: 2014-04-24 10:20:00 -0800 $
" $Rev: 1 $

" Compatible VIM syntax file start
" also, don't apply a syntax if one is already applied
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Scope is case sensitive
syn case match

" Sync-ing method
syn sync minlines=100

" Comments
syn match scopeComment /\/\/.*/
syn region scopeComment start=/\/\*/ end=/\*\//

" Basic Scope Keywords
syn keyword scopeKeyword COMBINE EXTRACT JOIN LIST SELECT PROCESS PRODUCE REDUCE
syn keyword scopeKeyword AS ASC DESC DISTINCT FROM HAVING ON OVER PRESORT RANK ROWCOUNT TO TOP UNION USING WHERE EXCEPT
syn keyword scopeKeyword SSTREAM OUTPUT REFERENCE RESOURCE VIEW MODULE LOCAL PARAMS INTO HASH FUNC BEGIN ROWSET
syn keyword scopeKeyword STREAMSET RANGE PATTERN __serialnum __date __hour __datetime
syn match scopeKeyword /\(GROUP\|ORDER\|PARTITION\|CLUSTERED\|SORTED\) BY/
syn match scopeKeyword /\(UNION\|EXCEPT\) ALL/
syn match scopeKeyword /SPARSE STREAMSET/
syn match scopeKeyword /RETURN ROWSET/
syn match scopeKeyword /DEFINE \(MODULE\|VIEW\)/
syn match scopeKeyword /END \(MODULE\|VIEW\|FUNC\)/
syn match scopeKeyword /WITH \(STREAMEXPIRY\|COLUMNGROUPS\)/
syn match scopeKeyword /\(INNER\|LEFT\|OUTER\|LEFT OUTER\|FULL OUTER\|RIGHT\| RIGHT OUTER\) JOIN/
syn match scopeKeyword /CROSS \(JOIN\|APPLY\)/

" Aggregators
syn keyword scopeAgg AVG COUNT FIRST LAST MAX MIN SUM ROW_NUMBER

" PreProc
syn match scopePreProc /#\(DECLARE\|SET\|CS\|ENDCS\|IF\|ELSEIF\|ELSE\|ENDIF\)/

" Variables
syn match scopeDefVar /@\w\+/
syn match scopeParamVar /@@\w\+@@/

" Special case for param variable inside a string
syn match scopeContainedParamVar /@@\w\+@@/ contained

" Constants
syn region scopeString start=/@"/ skip=/""/ end=/"/ contains=scopeContainedParamVar,ScopeDateParam
syn region scopeString start=/"/ skip=/\\"/ end=/"/ contains=scopeContainedParamVar,ScopeDateParam
syn region scopeString start=/'/ end=/'/
syn match scopeNumber /\<[0-9]\+/
syn match scopeDateParam /%\(Y\|m\|d\|h\)/

" Operators
"syn match scopeOperator /==\|+\|*\|-\|\//
syn keyword scopeOperator AND NOT OR ANY ALL IF REGEX

" Types
syn keyword scopeType string int DateTime long double float bool null

" Highlighting Rules (portable)
if version >= 508 || !exists("did_scope_syn_inits")
  if version < 508
    let did_scope_syn_inits = 1"" Setup default color highlighting
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink scopeComment Comment
  HiLink scopeString  String
  HiLink scopeNumber  Number
  HiLink scopeDateParam Special
  HiLink scopeContainedParamVar Special
  HiLink scopeKeyword Keyword
  HiLink scopeAgg     Function
  HiLink scopePreProc Define
  HiLink scopeDefVar  Identifier
  HiLink scopeParamVar  Identifier
  HiLink scopeOperator  Operator
  HiLink scopeType    Type
  delcommand HiLink
endif

let b:current_syntax = "scope"
