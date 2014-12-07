#!/usr/bin/env bash
cd $RSENSE_HOME/bin && ruby rsense server > /dev/null 2>&1 &
#lintnode --port 3003 > /dev/null 2>&1 &
sshfs Dealer:/home/afsmnghr ~/Dealer
ssh Dealer
