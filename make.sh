#! /usr/bin/bash

for output_lang in en+es en es ; do 
	commands=""
	for lang in en es ; do
		if [[ $output_lang =~ $lang ]]; then
			val=1
		else
			val=''
		fi
		commands="\\def\\outputlang$lang{$val}$commands"
	done
	if ! latexmk -jobname="cv altoe francisco ($output_lang)" -usepretex="$commands" -lualatex ; then
		break
	else
		latexmk -c -jobname="cv altoe francisco ($output_lang)"
	fi
done
