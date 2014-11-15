#!/usr/bin/env bash
cd $RSENSE_HOME/bin && ruby rsense server &
#lintnode --port 3003 &
sshfs Dealer:/home/afsmnghr ~/Dealer
ssh Dealer
