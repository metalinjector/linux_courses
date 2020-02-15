#!/bin/sh
# this script is running to create slides 
set -e
set -x

if [ "$1" ] 
then 
  slides_directory=$(dirname "$1" )
  files_to_render=./$(basename "$1")
  msg="Rendering single file ${files_to_render}"
else
  slides_directory="itacademy/LinuxEssBash/"
  files_to_render="./*linux-course*.tex"
  msg="Rendering all files in ${slides_directory}"
fi

# clean files from previous builds
make --directory=$slides_directory clean
cd $slides_directory
latexmk -CA

echo "$msg"
latexmk -pdfxe $files_to_render
