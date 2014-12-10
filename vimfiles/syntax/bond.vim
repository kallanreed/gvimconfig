" Vim syntax file
" Language:	Bond IDL
" Maintainer:	Kyle Reed <kylereed@microsoft.com>
" Version: 0.1
" 
" $LastChangedDate: 2014-12-09 15:00:00 -0800 $
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
syn match bondComment /\/\/.*/
syn region bondComment start=/\/\*/ end=/\*\//

" Basic bond Keywords
syn keyword bondKeyword import namespace using
syn keyword bondKeyword enum struct service sealed view_of
syn keyword bondKeyword void nothing required optional required_optional

" Types
syn keyword bondType bool uint8 uint16 uint32 uint64 int8 int16
syn keyword bondType int32 int64 float double string wstring blob
syn region bondAggType start=/\<\(list\|vector\|set\|nullable\|bonded\|map\)</ end=/>/ contains=bondType,bondAddType

" Constants
syn region bondString start=/"/ skip=/\\"/ end=/"/
syn match bondNumber /\<[0-9]\+/

" Bond field ordinals
syn match bondOrdinal /\<[0-9]\+:/

" Highlighting Rules (portable)
if version >= 508 || !exists("did_bond_syn_inits")
  if version < 508
    let did_bond_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  
  HiLink bondComment Comment
  HiLink bondKeyword Keyword
  HiLink bondString  String
  HiLink bondNumber  Number
  HiLink bondType    Type
  HiLink bondAggType Special
  HiLink bondOrdinal Special
  delcommand HiLink
endif

let b:current_syntax = "bond"
