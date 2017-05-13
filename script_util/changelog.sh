#!/bin/sh
# This program adds headers of a change log to ChangeLog
# It accepts: 
#	$1. path/to/changelog
#	$2. Author of changelog
# 	$3. Optional: email of author
#	$4. Optional: editor to use for editing

USAGE="$0 ChangeLog AUTHOR [EMAIL]"

if test "$#" -lt 2 ; then
	echo ${USAGE}
	exit 1
fi

EMAIL=""
DATE=`date +%Y-%m-%d`
if test -z $3; then
	EMAIL="<$3>"
fi
#sed -i '1s:^:${DATE} $2 ${EMAIL}:' $1 
sed -i '1s:^:${DATE} $2 ${EMAIL}\n:' $1
echo "sed? $?"
#TODO: work on $4, use vi(m) for now
#vi $1

