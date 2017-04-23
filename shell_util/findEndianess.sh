#!/bin/sh
# @author Jia Sheng Ma

# Little Endian orders its lest significant bytes from the smallest address
# Big Endian orders its most significant bytes from the smallest address -> human readable  

echo "#include <stdio.h>" > test.c
echo 'int main(){unsigned int i = 0x1;char *c = (char*) &i;printf("%x",*c);}' >> test.c
echo "" >> test.c
gcc test.c 2> /dev/null
ENDIANESS=""

# get test program output
if test $? = 0; then
	ENDIANESS=`./a.out`
else 
	echo "Failed to determine the endianess of the system"
	exit 1
fi
# if ENDIANESS = 1, then it is little, else it is big
if test "$ENDIANESS" = "1"; then
	echo Endian Little
else 
	echo Big Endian
fi

# clean up
rm -f a.out test.c

