#!/usr/bin/perl
# Name: gen_episodes.pl
# Version: 1
# Author: Jason Campisi
# Date: 7/10/2020
# Purpose: Generates a season and episode list template
# License: Released under GPL v2 or higher. Details here http://www.gnu.org/licenses/gpl.html
####
#Ussage: gen_episodes.pl Number-Of-Seasons Number-Of-Episodes-Per-Seasons 
# example: gen_episodes.pl 1 3
# S01E01 -
# S01E02 -
# S01E03 -

use strict;

sub pad($){ #add 0 padding???
  return ($_ >0 && $_ <10) ? "0$_" : $_;    #if 1->9 pad, otherwise nope  
}#end pad

if ($#ARGV !=1){ #Must have 2 arguments
    print " Ussage requires 2 parameters:\n   gen_episodes.pl NumberOfSeasons NumberOfEpisodesPerSeason\n\n";
    exit 0;
}

foreach(1..$ARGV[0]){ #loop for each season
    my $s=pad($_);
    foreach (1..$ARGV[1]){ #loop for each episode
        my $ep=pad($_);
        print "S" . $s . "E" . $ep . " - \n";
  }
  print "\n";    #add space between seasons
}

exit 0;