#ls color
alias ls='ls -F --color'
eval `dircolors ~/.colorrc`
#Manjaro's Japanese input setting
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
# make git command confortly
# use  find git-completion.bash or git-prompt.bash
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
#console
PS1=' \[\e[1;32m\]\u\[\e[1;36m\]:\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\[\e[m\]\$'
