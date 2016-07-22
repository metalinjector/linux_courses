#!/bin/bash
TEST=42; (echo Subshell TEST=$TEST; TEST=0; echo Subshell TEST=$TEST ); echo External TEST=$TEST
