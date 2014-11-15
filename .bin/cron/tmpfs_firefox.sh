#!/bin/bash

# Change this to match your correct profile
PROFILE="9shb6xj3.default"

find ~/.mozilla/firefox/ -name *.sqlite -exec sqlite3 {} VACUUM \;
find ~/.mozilla/firefox/ -name *.sqlite -exec sqlite3 {} REINDEX \;

cd "${HOME}/.mozilla/firefox"

if test -z "$(mount | grep -F "${HOME}/.mozilla/firefox/${PROFILE}" )"
then
    mount "${HOME}/.mozilla/firefox/${PROFILE}"
fi

if test -f "${PROFILE}/.unpacked"
then
    rsync -av --delete --exclude .unpacked ./"$PROFILE"/ ./profile/ > /dev/null 2>&1
else
    rsync -av ./profile/ ./"$PROFILE"/ > /dev/null 2>&1
    touch "${PROFILE}/.unpacked"
fi

exit
