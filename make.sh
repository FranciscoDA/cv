#! /usr/bin/bash

for output_dir in en+es en es ; do 
	mkdir -p $output_dir
	commands="\\input{cv.tex}"
	for lang in en es ; do
		if [[ $output_dir =~ $lang ]]; then
			val=1
		else
			val=''
		fi
		commands="\\def\\outputlang$lang{$val}$commands"
	done
	echo $commands
	lualatex -recorder -output-directory="$output_dir" "$commands"
	cp "$output_dir/cv.pdf" "./cv altoe francisco ($output_dir).pdf"
	#lualatex -recorder -output-directory="$output_dir" \\def\\outputinenglish{1}\\def\\outputinspanish{1}\\input{$file}
	#lualatex -recorder -output-directory="en" \\def\\outputinenglish{1}\\def\\outputinspanish{}\\input{$file}
	#lualatex -recorder -output-directory="es" \\def\\outputinenglish{}\\def\\outputinspanish{1}\\input{$file}
done

