#!/usr/bin/env sh

passwords=$(gpg --quiet -d ~/.mutt/passwords.gpg)
echo RELOADAGENT | gpg-connect-agent

eval "$passwords"
exec mutt "$@"

