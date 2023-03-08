#! /usr/bin/bash

for output_dir in en+es en es ; do 
	mkdir -p $output_dir
	commands=""
	for lang in en es ; do
		if [[ $output_dir =~ $lang ]]; then
			val=1
		else
			val=''
		fi
		commands="\\def\\outputlang$lang{$val}$commands"
	done
	echo $commands
	if latexmk -outdir="$output_dir" -usepretex="$commands" -lualatex ;
	then
		cp "$output_dir/cv.pdf" "./cv altoe francisco ($output_dir).pdf"
	else
		break
	fi
done

