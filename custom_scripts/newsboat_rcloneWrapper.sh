#!/usr/bin/env sh

rclone sync dropbox:sync/newsboat ~/dropbox/newsboat/
newsboat
rclone sync ~/dropbox/newsboat/ dropbox:/sync/newsboat
