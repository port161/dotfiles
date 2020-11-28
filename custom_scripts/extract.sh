#!/usr/bin/env sh

if [ -z "$@" ]; then
	# display usage if no parameters given
	echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
	echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
	return 1
else
	dir_name=$(echo "$@" | awk -F'.' '{print $1}') #rstrip file extension for dir name
	mkdir "$dir_name"
	mv "$@" ./"$dir_name";cd "$dir_name"
	if [ -f "$@" ] ; then
	  case "${@%,}" in
		*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
					 tar xvf "$@"       ;;
		*.lzma)      unlzma ./"$@"      ;;
		*.bz2)       bunzip2 ./"$@"     ;;
		*.rar)       unrar x -ad ./"$@" ;;
		*.gz)        gunzip ./"$@"      ;;
		*.zip)       unzip ./"$@"       ;;
		*.z)         uncompress ./"$@"  ;;
		*.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
					 7z x ./"$@"        ;;
		*.xz)        unxz ./"$@"        ;;
		*.exe)       cabextract ./"$@"  ;;
		*)
					 echo "extract: '$@' - unknown archive method"
					 return 1
					 ;;
	  esac
	else
	  echo "'$@' - file does not exist"
	  return 1
	fi
fi
