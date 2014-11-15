#!/bin/bash

deadbeef=$(ps -el | grep deadbeef | wc -l)

if test "$deadbeef" != 0;
then
    deadbeef --play-pause;
fi
exit
