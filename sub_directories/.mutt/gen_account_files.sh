#!/usr/bin/env sh

read -p 'Gmail? y/n: ' is_gmail

if [[ $is_gmail == y ]]; then

read -p 'Display name: ' name
read -p 'Email Address: ' email
read -p 'Make default account? y/n: ' default_acc

account=$(echo $email | awk -F '@' '{print $1}')

echo "set from=\""$name \<$email\>"\"
#Receive mail-GMAIL
set imap_user = '"$email"'
set imap_pass = \$gmail
#Sending mail-GMAIL
set smtp_url = '"smtps://$account@smtp.gmail.com"'
set smtp_pass = \$gmail
set record = \"\" #gmail server handles this automatically
#Server
set folder = imaps://imap.gmail.com/
set spoolfile = +INBOX
#set record = \"+[Gmail]/Sent Mail\"
set trash = \"+[Gmail]/Trash\"
set postponed = \"+[Gmail]/Drafts\"
#Saving
set header_cache = \"~/.mutt/cache/headers\"
set message_cachedir = \"~/.mutt/cache/bodies\"
set certificate_file = \"~/.mutt/certificates\"

unmailboxes *
mailboxes \"+INBOX\" \"+[Gmail]/Drafts\" \"+[Gmail]/Sent Mail\" \"+[Gmail]/Spam\" \"+[Gmail]/Trash\"
#set imap_check_subscribed

#Gmail macros
macro index gi 'c/INBOX<enter><enter>'
macro index gs 'c/\[Gmail\]<enter><enter>/Sent<enter><enter>'
macro index gd 'c/\[Gmail\]<enter><enter>/Trash<enter><enter>'
macro index Ms ':set confirmappend=no<enter>s^A^K=INbox<enter>:set confirmappend=yes<enter>'" > account.gmail

if [[ $default_acc == y ]]; then
	echo "#Default account" > temp
	echo "source ~/.mutt/account.$account" >> temp
fi

if [[ $default_acc == n ]]; then
	echo "#Default account" > temp
	cat mutt_account_settings | grep "source ~/.mutt/account" >> temp
fi

echo "
##Accounts##" >> temp

cat mutt_account_settings | grep "macro index" >> temp
echo "#macro index gn '<change-folder>imaps://imap.gmail.com<enter>'" >> temp

echo "
##Load imap folders when switching accounts##" >> temp

cat mutt_account_settings | grep "folder-hook" >> temp
echo "folder-hook 'imaps://imap.gmail.com' 'source ~/.mutt/account.gmail'" >> temp

mv temp mutt_account_settings

fi


if [[ $is_gmail == n ]]; then

read -p 'Account: ' account
read -p 'Server: ' server
read -p 'Display Name: ' name
read -p 'Email Address: ' email
read -p 'Username: ' username
read -p 'Make default account? y/n: ' default_acc

server_root=$(echo $server | awk -F '.' '{print $1}')
server_add=$(echo $server | sed "s/$server_root.//")

echo "set from=\""$name \<$email\>"\"
#Receive mail-$account
set imap_user = '$username'
set imap_pass = \$$account
#Sending mail-"$account"
set ssl_starttls = yes
set smtp_url = 'smtp://$username@smtp.$server_add:587/'
set smtp_pass = \$$account
#Server
set folder = imaps://imap.$server/
set spoolfile = \"+INBOX\"
set record =  \"+Sent Items\"
set postponed = \"+Drafts\"
set trash = \"+Deleted Items\"
#Saving
set header_cache = \"~/.mutt/cache/headers\"
set message_cachedir = \"~/.mutt/cache/bodies\"
set certificate_file = \"~/.mutt/certificates\"

unmailboxes *
mailboxes \"+INBOX\" \"+Sent Items\" \"+Drafts\" \"+Deleted Items\" 
#set imap_check_subscribed

#$account macros
macro index gi 'c/INBOX<enter><enter>'
macro index gs 'c/Sent Items<enter><enter>'
macro index gd 'c/Deleted Items<enter><enter>'
macro index Mi':set confirmappend=no<enter>s^A^K=Inbox<enter>:set confirmappend=yes<enter>'" > account."$account"

if [[ $default_acc == y ]]; then
	echo "#Default account" > temp
	echo "source ~/.mutt/account.$account" > temp
fi

if [[ $default_acc == n ]]; then
	echo "#Default account" > temp
	cat mutt_account_settings | grep "source ~/.mutt/account" > temp
fi

echo "
##Accounts##" >> temp

cat mutt_account_settings | grep "macro index" >> temp
echo "#macro index gn '<change-folder>imaps://imap.$server<enter>'" >> temp

echo "
##Load imap folders when switching accounts##" >> temp

cat mutt_account_settings | grep "folder-hook" >> temp
echo "folder-hook 'imaps://imap.$server' 'source ~/.mutt/account.$account'" >> temp

mv temp mutt_account_settings

fi
