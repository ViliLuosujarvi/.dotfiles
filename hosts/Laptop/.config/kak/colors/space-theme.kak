# Psychedelic Space (Enhanced Glow + Pastel Base)

evaluate-commands %sh{
    # base colors
    background='rgb:0A0A20'
    foreground='rgb:DB00FE'   # (main text) soft pastel yellow FFF4B0,
    			      # bright pumpkin F87217,  
    			      #     

    # palette
    red='rgb:D32F2F'
    pink='rgb:FF4081'
    green='rgb:4CAF50'
    yellow='rgb:FFEB3B'
    blue='rgb:2196F3'
    purple='rgb:9C27B0'
    cyan='rgb:00BCD4'
    gray='rgb:607D8B'

    orange='rgb:FF5722'
    amber='rgb:FF9800'
    bright_green='rgb:00E676'
    lime='rgb:CDDC39'
    teal='rgb:009688'
    deep_purple='rgb:673AB7'
    indigo='rgb:3F51B5'
    white='rgb:FFFFFF'

    # special
    cursor='rgb:FFFFFF'
    selection_bg='rgb:80DEEA'
    selection_fg='rgb:000000'

    echo "
        #base text
        face global Default           ${foreground},${background}

        #code (BOOSTED contrast + bold on important things)
        face global value              ${cyan}+b
        face global type               ${purple}+b
        face global variable           ${blue}
        face global module             ${indigo}+b
        face global function           ${pink}+b
        face global string             ${bright_green}
        face global keyword            ${yellow}+b
        face global operator           ${amber}+b
        face global attribute          ${pink}
        face global comment            ${gray}+i
        face global meta               ${orange}
        face global builtin            ${cyan}+b

        #markup
        face global title              ${pink}+b
        face global header             ${purple}+b
        face global bold               ${foreground}+b
        face global italic             ${gray}+i
        face global mono               ${gray}
        face global block              ${blue}
        face global link               ${cyan}+b
        face global bullet             ${yellow}+b
        face global list               ${green}

        #UI (more glow + contrast)
        face global Error              ${red},default+b
        face global Information        ${foreground},${background}

        face global LineNumberCursor   ${yellow},${background}
        face global LineNumbers        ${gray},${background}
        face global LineNumbersWrapped ${gray},${background}

        face global MatchingChar       ${pink},${background}+b

        face global MenuBackground     ${foreground},${background}
        face global MenuForeground     ${background},${yellow}+b
        face global MenuInfo           ${gray}

        face global PrimaryCursor      ${selection_fg},${cursor}
        face global PrimaryCursorEol   ${background},${white}
        face global PrimarySelection   ${selection_fg},${selection_bg}

        face global Prompt             ${pink}+b

        face global SecondaryCursor    ${background},${gray}
        face global SecondaryCursorEol ${background},${white}
        face global SecondarySelection ${foreground},${gray}

        face global StatusCursor       ${background},${white}
        face global StatusLine         ${foreground},${background}+b
        face global StatusLineInfo     ${cyan}+b
        face global StatusLineMode     ${amber}+b
        face global StatusLineValue    ${bright_green}+b
    "
}
