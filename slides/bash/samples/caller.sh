#!/bin/bash
backtrace() {
  echo Backtrace:
  for((i=$SHLVL;i>=0;i--)); do
    caller $i
  done
}
f1() { echo Function $FUNCNAME at $LINENO && backtrace ;}
f2() { f1 ; }
f2
