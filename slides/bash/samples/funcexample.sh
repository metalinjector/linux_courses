#!/bin/bash

function help {
  echo "Использование: $0 <string>"
  exit 1
}

f1(){
  echo Вызвана функция $FUNCNAME с $# аргументами
}

f2(){
  while read str; do
    echo ${FUNCNAME}: прочитана строка: $str
  done
}

[ $# -eq 0 ] && help

f1 "$@"

{ for ((i=0;i<5;i++));do
  echo $@
done } | f2

exit
