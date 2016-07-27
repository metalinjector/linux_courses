#!/bin/bash

VAR=test
f1(){
  local VAR=test1
  echo Function ${FUNCNAME}: VAR=$VAR
}
f2(){
  VAR=test2
  echo Function ${FUNCNAME}: VAR=$VAR
}

echo Before f1: VAR=$VAR
f1
echo Before f2: VAR=$VAR
f2
echo After f2: VAR=$VAR
