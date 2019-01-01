#!/bin/sh
# this script is running to create slides 

dir_slides=itacademy/LinuxEssBash/

make --directory=$dir_slides clean
cd $dir_slides
latexmk -CA
latexmk -pdfxe ./*linux-course.tex
