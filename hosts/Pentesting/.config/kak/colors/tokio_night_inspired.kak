declare-option str fg "7FF7FF"
declare-option str bg "default"
declare-option str subbg "default"

declare-option str red "FF4A4A"
declare-option str green "EAEA32"   #5CFF2A
declare-option str yellow "5CFF2A"   #FFF04A,  E9DE65,  #EAEA32
declare-option str orange "FF7A1A"
declare-option str blue "4AB3FF"
declare-option str magenta "FF2FA3"
declare-option str purple "B26BFF"
declare-option str cyan "00F5FF"
declare-option str dark_cyan "00CFCF"
declare-option str dark_blue "2874AB"

declare-option str comment "3FAF9F"

declare-option str selectionalpha "65"

declare-option str menuselection "3A3AFF"

set-face global keyword "rgb:%opt{magenta}+b"
set-face global operator "rgb:%opt{magenta}+b"

set-face global function "rgb:%opt{blue}+b"
set-face global attribute "rgb:%opt{orange}"
set-face global builtin "rgb:%opt{dark_cyan}+b"

set-face global type "rgb:%opt{magenta}"
set-face global module "rgb:%opt{blue}"

set-face global variable "rgb:%opt{fg}"
set-face global value "rgb:%opt{dark_cyan}"

set-face global string "rgb:%opt{green}"
set-face global meta "rgb:%opt{purple}"

set-face global comment "rgb:%opt{comment}+i"
set-face global documentation "rgb:%opt{comment}+i"

set-face global title "rgb:%opt{orange}+b"
set-face global header "rgb:%opt{magenta}+b"
set-face global mono "rgb:%opt{dark_cyan}"
set-face global block "rgb:%opt{blue}"
set-face global link "rgb:%opt{dark_cyan}+b"
set-face global bullet "rgb:%opt{magenta}+b"
set-face global list "rgb:%opt{green}"

set-face global Default "rgb:%opt{fg},default"

set-face global PrimarySelection "rgb:FF1FA3,rgb:%opt{yellow}"
set-face global SecondarySelection "rgb:%opt{red},rgba:%opt{yellow}%opt{selectionalpha}"

set-face global PrimaryCursor "rgb:FF1FA3,rgb:%opt{yellow}"
set-face global SecondaryCursor "rgb:FF1FA3,rgb:%opt{yellow}"
set-face global PrimaryCursorEol "rgb:FF1FA3,rgb:%opt{yellow}"
set-face global SecondaryCursorEol "rgb:FF1FA3,rgb:%opt{yellow}"

set-face global LineNumbers "rgb:%opt{comment}"
set-face global LineNumberCursor "rgb:%opt{yellow}"
set-face global LineNumbersWrapped "default,default"

set-face global MenuForeground "rgb:%opt{fg},rgb:%opt{menuselection}"
set-face global MenuBackground "rgb:%opt{fg},default"
set-face global MenuInfo "rgb:%opt{dark_cyan}"

set-face global Information "rgb:%opt{fg},default"
set-face global Error "rgb:%opt{red}"

set-face global StatusLine "rgb:%opt{fg},default"
set-face global StatusLineMode "rgb:%opt{magenta}+b"
set-face global StatusLineInfo "rgb:%opt{dark_cyan}"
set-face global StatusLineValue "rgb:%opt{green}+b"

set-face global StatusCursor "rgb:000000,rgb:%opt{yellow}"
set-face global Prompt "rgb:%opt{magenta}+b"

set-face global MatchingChar "+bu"

set-face global BufferPadding "default,default"
set-face global Whitespace "rgb:%opt{comment}"

set-face global InlayHint "+d@type"
set-face global parameter "+i@variable"
set-face global enum "rgb:%opt{dark_cyan}"

set-face global InlayDiagnosticError "rgb:%opt{red}"
set-face global InlayDiagnosticWarning "rgb:%opt{magenta}"
set-face global InlayDiagnosticInfo "rgb:%opt{dark_cyan}"
set-face global InlayDiagnosticHint "rgb:%opt{green}"

set-face global LineFlagError "rgb:%opt{red}"
set-face global LineFlagWarning "rgb:%opt{magenta}"
set-face global LineFlagInfo "rgb:%opt{dark_cyan}"
set-face global LineFlagHint "rgb:%opt{green}"

set-face global DiagnosticError ",,rgb:%opt{red}+c"
set-face global DiagnosticWarning ",,rgb:%opt{magenta}+c"
set-face global DiagnosticInfo ",,rgb:%opt{dark_cyan}+c"
set-face global DiagnosticHint ",,rgb:%opt{green}+c"

set-face global InfoDefault Information
set-face global InfoBlock block
set-face global InfoBlockQuote block
set-face global InfoBullet bullet
set-face global InfoHeader header
set-face global InfoLink link
set-face global InfoLinkMono header
set-face global InfoMono mono
set-face global InfoRule comment
set-face global InfoDiagnosticError InlayDiagnosticError
set-face global InfoDiagnosticHint InlayDiagnosticHint
set-face global InfoDiagnosticInformation InlayDiagnosticInfo
set-face global InfoDiagnosticWarning InlayDiagnosticWarning

try %{ set-option global rainbow_colors "rgb:%opt{magenta}" "rgb:%opt{dark_cyan}" "rgb:%opt{blue}" }
