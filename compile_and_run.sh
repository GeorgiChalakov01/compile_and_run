#!/bin/sh

# Flags
# compile_and_run -n source_file_name_to_be_compiled.c
# compile_and_run -c  CLEARS THE SCREEN BEFOREHAND
# compile_and_run  WITH NO ARGUMENTS AND NO FLAGS
# 		COMPILES AND RUND main.c

name=NULL

while getopts 'n:c' opt; do
	case $opt in
		c)
			clear
			;;
		n)
			name=$OPTARG
			output=$(echo ${name::-1})'out'
			gcc $name -o $output
			./$output

			flag=false
			;;
		\?)
			echo "Invalid option: -$OPTARG!"
			exit 1
			;;
		:)
			echo "This is it"
			;;
	esac
done

if $flag;
then
	name=main.c
	gcc $name
	output=$(echo ${name::-1})"out"
	./$output
fi

echo
