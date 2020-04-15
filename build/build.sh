#!/bin/sh
# this script is running to create slides 
set -e
set -x

# no arguments - compile all files in default directory
slides_directory=${1:-./itacademy/LinuxEssBashOnline/}

# compile all files in directory
if [ -d "$slides_directory" ]
  then
  files_to_render="./*linux-course*.tex"
  msg="Rendering all files in ${slides_directory}"
fi

# compile single file in directory
if [ -f "$slides_directory" ]
  then
  slides_directory=$(dirname "$1" )
  files_to_render=./$(basename "$1")
  msg="Rendering single file ${files_to_render}"
fi

# clean files from previous builds
make --directory=$slides_directory clean
bash -x $(type -p texhash)
mktexlsr
cd $slides_directory
latexmk -CA

echo "$msg"
latexmk -pdfxe $files_to_render
