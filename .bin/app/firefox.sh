#!/bin/bash

/bin/bash ~/.bin/cron/tmpfs_firefox.sh > /dev/null 2>&1 &
VDPAU_DRIVER=va_gl firefox-nightly > /dev/null 2>&1 &
exit
