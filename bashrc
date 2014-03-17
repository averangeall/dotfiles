# aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias grep='grep --color=auto'
alias q='exit'
alias du='du -sh'
alias pingg='ping 8.8.8.8'
alias shutup='dbus-send --system --print-reply --dest=org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'

# auto completion
if [ -f /etc/bash_completion ]
then
    . /etc/bash_completion
fi

# my scripts
PATH=$PATH:~/coding/scripts

# git branch
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo " ("${ref#refs/heads/}") ";
}

# simple prompt
PS1='\u@\h:\W$(git_branch)\$ '

# my favorite editor
export EDITOR=vim

# data backup
complete -W "desktop htdocs images music videos nothing something uptu" coming

# shut down alarm
which easyps > /dev/null && easyps random-play -k

# android vm development
function ad {
    cd ~/coding/leisure/android/
    . build/envsetup.sh
    lunch aosp_arm-eng
    export PATH=~/bin:$PATH
}

# latex
function onetex {
    if [ "$1" != "" ]
    then
        filename=$1
    else
        filename=main
    fi
    pdflatex $filename
    bibtex $filename
    pdflatex $filename
    pdflatex $filename
}

