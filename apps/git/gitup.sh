#!/bin/bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

## Quick git commit local changes and push to online account

REPOSITORY="$HOME/Documents/Github/myrepository"

clear

echo
echo -e "$COL_YELLOW myrepository $COL_RESET"
echo

cd $REPOSITORY
git add -A . 
git add -u 
git commit -am "`date`" 
git push origin master 

echo
echo -e "$COL_MAGENTA myrepository Updated :-) $COL_RESET"
echo

exit 0
