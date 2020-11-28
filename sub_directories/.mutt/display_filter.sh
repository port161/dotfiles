#!/bin/sh

MESSAGE=$(cat)

#Add new addresses to aliases
NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($2)"-"tolower($(NF-1)) $0;}}')

if grep -Fxq "$NEWALIAS" $HOME/.mutt/aliases.txt; then
    :
	:
elif ! echo $NEWALIAS | grep "@" > /dev/null;then
	:
else
    echo "$NEWALIAS" >> $HOME/.mutt/aliases.txt
fi

echo "${MESSAGE}"

