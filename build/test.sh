#!/bin/bash
# simple test to check pdf file names 
slides_dir=./itacademy/LinuxEssBash/
slides_list="
01-linux-course.pdf
02-linux-course.pdf
02-linux-course-selflearn.pdf
03-linux-course.pdf
04-linux-course.pdf
04-linux-course-selflearn.pdf
05-linux-course.pdf
05-linux-course-selflearn.pdf
06-linux-course.pdf
"
for file in $slides_list
do
  ls $slides_dir/$file
done
