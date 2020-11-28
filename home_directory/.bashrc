# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM=xterm-color

#vim keybindings
set -o vi

#paths
export C_INCLUDE_PATH=$HOME/.local/include
export CPLUS_INCLUDE_PATH=$HOME/.local/include
export LIBRARY_PATH=$HOME/.local/lib
export LIBRARY_PATH=$HOME/.local/include:$LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib64/pkgconfig:
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$HOME/.local/include/X11:$PKG_CONFIG_PATH
export W3MIMGDISPLAY_PATH=$HOME/.local/libexec/w3m/w3mimgdisplay
export PATH=$PATH:/$HOME/.local/bin:$PATH
export PATH=$PATH:/$HOME/.local/go/bin:$PATH
export PATH=$PATH:/$HOME/.local/lib64/:$PATH
export PATH=$PATH:/$HOME/.local/lib/:
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:~/bin/

#aliases
alias ranger='python ~/ranger/ranger.py --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"' #exit to terminal in current directory
alias hterm='urxvt &'
alias mutt='mutt_tmux_launcher'
alias man='vim_man'
alias newsboat='newsboat_rcloneWrapper.sh'

#functions
#Read man pages with vim
function vim_man()
{
	if ! command man "$@" > /dev/null;then 
		:
	else
		vim <(command man "$@")
	fi
}

function mutt_tmux_launcher()
{
	tmux new-session -d -s "mutt" ~/.mutt/mutt_pwd_wrapper.sh
	tmux attach -t "mutt"
}

function newsboat_launcher()
{
	if ls ~/.newsboat/ | grep cache.db >/dev/null;then
		rm .newsboat/cache.db
	fi
	command newsboat
}

function cs()
{
	cd "$@";ls
}

function reset_gpg()
{
	echo RELOADAGENT | gpg-connect-agent
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      dir_name=$(echo "$@" | awk -F'.' '{print $1}') #strip file extension for dir name
	  mkdir "$dir_name"
	  mv "$@" ./"$dir_name";cd "$dir_name"
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar e ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
	  mv "$@" ../;cd ../
    done
fi
}
