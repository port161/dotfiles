#!/usr/bin/env bash

#Define paths
home=~
dot_dir=~/dotfiles

home_files=$(ls -a $dot_dir/home_directory)
sub_direc_files=$(ls -a $dot_dir/sub_directories)
custom_scripts=$(ls $dot_dir/custom_scripts)

mkdir -p ~/old_dotfiles

for file in $home_files
do
	#ls -a prints . and .. first. skip them
	if [ $(echo $file) != "." ];then
		if [ $(echo $file) != ".." ];then
			#if file already exists, backup then symlink
			if [ -e ~/$file ];then
				mv ~/$file ~/old_dotfiles/
				ln -sf $dot_dir/home_directory/$file ~/$file
			fi
			#if file doesnt exist, symlink
			if [ ! -e ~/$file ];then
				ln -sf $dot_dir/home_directory/$file ~/$file
			fi
		fi
	fi
done

#for ~/... eg .config etc
for file in $sub_direc_files
do
	#ls -a prints . and .. first. skip them
	if [ $(echo $file) != "." ];then
		if [ $(echo $file) != ".." ];then
			mkdir -p ~/$file
			contents=$(ls $dot_dir/sub_directories/$file)
			for item in $contents
			do
				#if file already exists, backup then symlink
				if [ -e ~/$file/$item ];then
					mkdir -p ~/old_dotfiles/$file
					mv ~/$file/$item ~/old_dotfiles/$file
					ln -sf $dot_dir/sub_directories/$file/$item ~/$file
				fi
				if [ ! -e ~/$file/$item ];then
					ln -sf $dot_dir/sub_directories/$file/$item ~/$file
				fi
			done
		fi
	fi
done

for file in $custom_scripts
do
	#just force these, no backup needed as not on a vanilla system
    sudo ln -sf $dot_dir/custom_scripts/$file /usr/local/bin/
	#sudo ln -sf $dot_dir/custom_scripts/$file ~/.local/bin/
done
