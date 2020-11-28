#!/usr/bin/env sh
#Gen dictionaries for snippets

current_dir=$(pwd)
mkdir -p SNIPPETS

cd $@
filenames=$(ls | grep .snippets)
for file in $filenames ; do
	new_name=$(echo $file | awk -F '.' '{print $1}')
	cat $file | grep snippet | awk -F ' ' '{print $2}' | sed '/^\s*$/d' >> "$current_dir/SNIPPETS/$new_name"
done

cd $current_dir
