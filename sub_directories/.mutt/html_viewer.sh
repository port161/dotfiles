#!/usr/bin/env sh

MESSAGE=$(cat)

touch ~/.mutt/temp_html_mail.html
echo "$MESSAGE" > ~/.mutt/temp_html_mail.html 

cd ~/qutebrowser/
python3 -m qutebrowser ~/.mutt/temp_html_mail.html;sleep 0.5

shred ~/.mutt/temp_html_mail.html
rm ~/.mutt/temp_html_mail.html
