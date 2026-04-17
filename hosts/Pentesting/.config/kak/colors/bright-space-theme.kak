evaluate-commands %sh{
    background='rgb:0A0A20'
    foreground='rgb:19E7FF' #EAE2FF

    control='rgb:F61D99' #DB00FE, DF19FF(purple), F1EA3B(yellow)
 
    red='rgb:FF3B3B'
    pink='rgb:FF3696'
    green='rgb:39FF14'
    deep_green='rgb:1E6500'
    blue='rgb:3DA5FF'
    deep_blue='rgb:3030FF'
    purple='rgb:B26BFF'
    cyan='rgb:00F5FF'
    yellow='rgb:F1EA3B'
    light_yellow='rgb:F3ED53'
    red='rgb:D52F2F'
    pinkier_pink='rgb:C78CA4'

    orange='rgb:FF6D00'
    amber='rgb:FFB300'
    bright_green='rgb:00FF6A'
    lime='rgb:D4FF00'
    teal='rgb:2C9C93'

    deep_purple='rgb:7C7CFF'
    indigo='rgb:5B6CFF'
    white='rgb:FFFFFF'

    cursor='rgb:FFFFFF'
    selection_bg='rgb:F6F186' #F5F075
    selection_fg='rgb:000000'

    echo "
        face global Default            ${foreground},${background}

        face global keyword            ${purple}+b
        face global operator           ${control}+b

        face global function           ${deep_purple}+b
        face global attribute          ${orange}+b

        face global type               ${purple}+b
        face global module             ${deep_purple}+b

        face global variable           ${blue}
        face global builtin            ${cyan}+b
        face global value              ${cyan}

        face global string             ${bright_green}
        face global meta               ${lime}

        face global comment            ${teal}+i

        face global title              ${pink}+b
        face global header             ${purple}+b
        face global bold               ${deep_green}+b
        face global italic             ${teal}+i
        face global mono               ${cyan}

        face global block              ${blue}
        face global link               ${cyan}+b
        face global bullet             ${control}+b
        face global list               ${bright_green}

        face global Error              ${red},default+b
        face global Information        ${foreground},${background}

        face global LineNumberCursor   ${control},${background}
        face global LineNumbers        ${pinkier_pink}
        face global LineNumbersWrapped ${pinkier_pink}

        face global MatchingChar       ${pink},${background}+b

        face global MenuBackground     ${foreground},${background}
        face global MenuForeground     ${background},${control}+b
        face global MenuInfo           ${cyan}

        face global PrimaryCursor      ${background},${yellow}
        face global PrimaryCursorEol   ${background},${yellow}
        face global PrimarySelection   ${background},${selection_bg}

        face global Prompt             ${control}+b

        face global SecondaryCursor    ${background},${purple}
        face global SecondaryCursorEol ${background},${white}
        face global SecondarySelection ${foreground},${purple}

        face global StatusCursor       ${background},${white}
        face global StatusLine         ${blue}+b  
        face global StatusLineInfo     ${blue}+b
        face global StatusLineMode     ${yellow}+b
        face global StatusLineValue    ${bright_green}+b
    "
}
