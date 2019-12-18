#!/bin/sh
# this script is running to create slides 

file_to_render=$1

dir_slides=itacademy/LinuxEssBash/

make --directory=$dir_slides clean
cd $dir_slides
latexmk -CA

if [ -z "$file_to_render" ] 
then 
   latexmk -pdfxe ./*linux-course*.tex
else
   latexmk -pdfxe ./$(basename "$file_to_render")
fi
