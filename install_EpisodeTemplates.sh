#!/bin/sh -e
#Author: Jason Campisi
#Date: 7/12/2020
#version 0.4.0
#Released under the GPL v2 or higher

NAMEGEN="genepisodes"
NAMESTRIP="stripepisodes"
EXTPL="pl"
EXT=""

while true; do
    read -p "Do you wish to install GenEpisodes as perl (pl) or python (py)? " answer
    case $answer in
        perl | pl) 
            EXT="pl"; 
            break;;
        python | py ) 
            EXT="py"; 
            break;;
        * ) echo "Please answer perl(pl) or python(py)!";
    esac
done

FILEG="$NAMEGEN.$EXT"
FILES="$NAMESTRIP.$EXTPL"
LOCATION="/opt/local/bin/"
echo " installer: $FILEG";
echo " installer: $FILES";

#PART 1
 echo " Checking if '$FILEG' exists in the current folder..."
   if [ ! -n "$FILEG" ]; then
      echo "  Error - Filename is not set!"
      exit 1;
   elif [ ! -e "$FILEG" ]; then
      echo "  Error - The location of '$FILEG' does not exist!"
      exit 1;
   fi
 echo "   ...found!";
 echo " Checking if '$FILES' exists in the current folder..."
   if [ ! -n "$FILES" ]; then
      echo "  Error - Filename is not set!"
      exit 1;
   elif [ ! -e "$FILES" ]; then
      echo "  Error - The location of '$FILES' does not exist!"
      exit 1;
   fi
 echo "   ...found!"; 
 
 
echo " Setting $FILEG to executable...";
    chmod +x ./$FILEG
echo " Setting $FILES to executable...";
    chmod +x ./$FILES    

#PART 2
#Do we have perl?
echo " Checking for Perl at /usr/bin/perl ...";
if [ "$(whereis perl)" != '/usr/bin/perl' ]; then
	echo " Error: Perl can not be found.";
	echo " ->If it is installed, then make a symlink that points /usr/bin/perl to the right location, else please install it.";
	exit 1;
else 
	echo "   ...Perl found!";
fi

#Do we have python?
if [[ $EXT =~ .*py* ]]; then
    echo " Checking for Python at /usr/bin/python ...";
    if [ "$(whereis python)" != '/usr/bin/python' ]; then
        echo "  Error: Python can not be found.";
	   echo "  ->If it is installed, then make a symlink that points /usr/bin/python to the right location, else please install it.";
	   exit 1;
    else 
	   echo "   ...Python found!";
    fi
fi

#PART 3
echo " Checking if you have the clearance to install this ...";
if [ "$(whoami)" != 'root' ]; then
	echo "  You do not have permission to install ./$FILEG & ./$FILES";
	echo "    -You must be a root user.";
	echo "    -Try instead: sudo $0";
	exit 1;
else
	echo "  Root access granted for $0";	
fi

#PART 4
echo " Installing $NAMEGEN to $LOCATION/$NAMEGEN ...";
    cp ./$FILEG $LOCATION/$NAMEGEN
echo " Installing $NAMESTRIP to $LOCATION/$NAMESTRIP ...";
    cp ./$FILES $LOCATION/$NAMESTRIP
echo "...Setup complete!"
