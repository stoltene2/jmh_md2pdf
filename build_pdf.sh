#!/bin/bash

# dependencies:
#
# http://johnmacfarlane.net/pandoc/installing.html
#
# package like xelatex, pdflatex, lualatex

# variables:

mainfont="Helvetica"
sansfont="Helvetica"
monofont="Courier"
fontsize="14pt"

file_path='example_md/'

latex_header_path='mytemplate.tex'

export_path='example_pdf/'

for input in $(find $file_path*.md -type f -maxdepth 1 \( ! -iname ".*" \))
do
	basename=`basename $input .md`
    echo 'building:' $basename
	pandoc -N --template=$latex_header_path --variable mainfont=$mainfont --variable sansfont=$sansfont --variable monofont=$monofont --variable fontsize=$fontsize --listings $input --latex-engine=pdflatex --toc -o $export_path$basename.pdf
    
done
