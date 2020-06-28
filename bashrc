#console
PS1=' \[\e[1;32m\]\u\[\e[1;36m\]:\w\n\[\e[m\]\$'
#ls color
alias ls='ls -F --color'
eval `dircolors ~/.colorrc`
#Manjaro's Japanese input setting
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

