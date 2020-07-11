#!/bin/sh -e
#Author: Jason Campisi
#Date: 7/11/2020
#version 0.3.0
#For MacOS X.11 or higher
#Released under the GPL v2 or higher

NAMEGEN="genepisodes"
NAMESTRIP="stripepisodes"
EXT="pl"
FILEG="$NAMEGEN.$EXT"
FILES="$NAMESTRIP.$EXT"
LOCATION="/opt/local/bin/"
echo "$FILE installer:";

#PART 1
 echo " Checking if '$FILEG' exists in the current folder..."
   if [ ! -n "$FILEG" ]; then
      echo " Error - Filename is not set!"
      exit 1;
   elif [ ! -e "$FILEG" ]; then
      echo " Error - The location of '$FILEG' does not exist!"
      exit 1;
   fi
 echo " ...found!";
 echo " Checking if '$FILES' exists in the current folder..."
   if [ ! -n "$FILES" ]; then
      echo " Error - Filename is not set!"
      exit 1;
   elif [ ! -e "$FILES" ]; then
      echo " Error - The location of '$FILES' does not exist!"
      exit 1;
   fi
 echo " ...found!"; 
 
 
echo " Setting $FILEG to executable...";
    chmod +x ./$FILEG
echo " Setting $FILES to executable...";
    chmod +x ./$FILES 

#PART 2
echo " Checking for Perl at /usr/bin/perl ...";
if [ "$(whereis perl)" != '/usr/bin/perl' ]; then
	echo " Error: Perl can not be found.";
	echo " ->If it is installed, then make a symlink that points /usr/bin/perl to the right location, else please install it.";
	exit 1;
else 
	echo " ...Perl found!";
fi

echo " Checking if you have the clearance to install this ...";
if [ "$(whoami)" != 'root' ]; then
	echo " You do not have permission to install ./$FILEG & ./$FILES";
	echo " ->You must be a root user.";
	echo " ->Try instead: sudo $0";
	exit 1;
else
	echo " Root access granted for $0";	
fi

#PART 3
echo " Installing $NAMEGEN to $LOCATION/$NAMEGEN ...";
    cp ./$FILEG $LOCATION/$NAMEGEN
echo " Installing $NAMESTRIP to $LOCATION/$NAMESTRIP ...";
    cp ./$FILES $LOCATION/$NAMESTRIP
echo " Setup complete."
