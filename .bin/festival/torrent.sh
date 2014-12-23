#!/bin/bash

scripts="$HOME/.bin/festival/"
text=$(echo "Загр+узка завершена")

${scripts}stop_play.sh > /dev/null 2>&1
${scripts}say.sh "$text"
${scripts}stop_play.sh > /dev/null 2>&1
