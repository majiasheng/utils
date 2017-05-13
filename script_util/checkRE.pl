#!/usr/bin/perl

# @author: Jia Sheng Ma
# @email : jiasheng.ma@yahoo.com

# This script accepts a regular expression pattern
# and user would then enter strings to check whether 
# they have match with the pattern.

use strict;
use warnings;

my $USAGE = "$0 'PATTERN'\n";

if(@ARGV != 1) {
	print "Usage: $USAGE";
	print "Example usage: $0 '^\$'\n";
	print "\tChecks for lines that are empty\n";
	exit 1;
}

my $pattern = $ARGV[0];
while(my $string = <STDIN>) {
	chomp $string; # strip trailing space(s)
	if($string =~ /$pattern/) {
		# print matching part
		print "$`<$&>$'\n";
	} else {
		print "No Match\n";
	}
	
}
