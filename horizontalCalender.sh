#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

echo `cal` | sed -e 's/[A-Z][a-z] //g' \
-e 's/[0-9]\{4\}/ /g' \
-e 's/[ ]\{2\}//g' \
-e 's/^[ ]//' \
-e 's/ / • /g' \
-e 's/ • / /' \
-e "s/$/   $(echo '\033[1;31m')$(date +%A)$(echo  '\033[0m')/" \
| sed -E '1,$'"s/ ($(date +%e | sed -e 's/^[ ]//'))( |$)/ $(echo '\033[1;31m')[ \1 ]$(echo  '\033[0m')\2/" \
| sed -E '1,$'"s/($(date +%B))( |$)/$(echo '\033[1;31m')\1$(echo  '\033[0m')\2  /" 
