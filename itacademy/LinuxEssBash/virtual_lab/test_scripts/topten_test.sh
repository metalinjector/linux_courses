#!/bin/bash

# this is initial version to test hometask script
# place this file to directory with script
# run:  bash topten_test.sh ./topten.sh 

script_name=${1:-tt.sh}

is_exit_error(){
	[ $1 != 0 ] && echo pass
}

is_exit_success(){
	[ $1 == 0 ] && echo pass
}

# task create directory with files
# files with sizes from 1M, 2M, 3M to 10M
# names file_size_1M

test_dir_big_files(){
	test_dir_name=${1:-test_dir}
 	[ -d "$test_dir_name" ] || mkdir "$test_dir_name"
	for size in {1..10}
	do
	  dd if=/dev/urandom of=./"${test_dir_name}"/file_size_${size}M bs=1M count=$size 1>/dev/null 2>&1 
	done
       echo bash "$script_name" "$test_dir_name" 
       bash "$script_name" "$test_dir_name" 
}

test_help(){
  echo bash "$script_name" -h
  bash "$script_name" -h
  is_exit_success $?
}

test_two_args(){
  echo bash "$script_name" argument1 argument2
  bash "$script_name" argument1 argument2
  is_exit_error $?
}

test_noargs(){
  echo bash "$script_name"
  bash "$script_name"
  is_exit_error $?
}

test_non_exised_file(){
  echo bash "$script_name" /abcd
  bash "$script_name" /abcd
  is_exit_error $?
}

test_non_dir_file(){
  echo bash "$script_name" /etc/passwd
  bash "$script_name" /etc/passwd
  is_exit_error $?
}

test_spaces(){
  test_dir_big_files "dir with spaces"
}

test_dir_big_files
test_spaces
test_help
test_two_args
test_non_exised_file
test_non_dir_file
