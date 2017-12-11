#!/usr/bin/env sh

9 unmount /mnt/plumb
9 unmount /mnt/acme
9 unmount /mnt/fontsrv

if pgrep -x "plumber" > /dev/null
then
    pkill plumber
fi
 
if pgrep -x "acme" > /dev/null
then
    pkill acme
fi

if mount | grep /mnt/fontsrv > /dev/null
then
    unmount /mnt/fontsrv
fi

if mount | grep /mnt/acme > /dev/null
then
    unmount /mnt/acme
fi

if mount | grep /mnt/plumb > /dev/null
then
    unmount /mnt/plumb
fi

rm -rf `namespace`