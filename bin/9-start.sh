#!/usr/bin/env sh

if ! pgrep -x "plumber" > /dev/null
then
    plumber
    9pfuse `namespace`/plumb /mnt/plumb
    cat $HOME/git/plan9/lib/plumbing $PLAN9/plumb/initial.plumbing | 9p write plumb/rules > /dev/null
fi

if ! pgrep -x "fontsrv" > /dev/null
then
    fontsrv&
fi

ACMEFONT="/mnt/font/Go Mono for Powerline/10a/font"

export PAGER=cat
export MANPAGER=cat
export SHELL="rc -l"
export prompt='$ '
export EDITOR=E

if ! pgrep -x "acme" > /dev/null
then
    acme -m /mnt/acme &
fi
