#!/usr/bin/perl
# Name: gen_episodes.pl
# Version: 2
# Author: Jason Campisi
# Date: 7/11/2020
# Purpose: Generates a season and episode list template
# License: Released under GPL v2 or higher. Details here http://www.gnu.org/licenses/gpl.html

use strict;
use Getopt::Long;

my ($season, $episodes,$nameOfShow, $help) = (0,0,0,0);
GetOptions("s:s"  =>\$season, "e:s" =>\$episodes, "n=s" =>\$nameOfShow, "help" =>\$help);

sub check(){ # check required data or if help was called
  if ($help or ($season <=0 or $episodes <=0) ){ 
  print <<EOD;
GenEpisodes Generates a season and episode list template
    Ussage:             gen_episodes.pl -s=Seasons -e=Episodes
    
        -s=xxx          Number of Seasons you want to list 
        -e=xxx          Number of Episodes you wish to have per season
    
    Optional:
        -n=showName     This will place the name before the each episode line 
        -help
        
Example: gen_episodes.pl 2 3 Nuts
Nuts S01E01 -
Nuts S01E02 -
Nuts S01E03 -

Nuts S02E01 -
Nuts S02E02 -
Nuts S02E03 -

EOD
    exit 0;    
  }
}#end Check

sub pad($){ #add 0 padding???
  return ($_ >0 && $_ <10) ? "0$_" : $_;    #if 1->9 pad, otherwise nope  
}#end pad

check();

foreach(1..$season){ #loop for each season
    my $s=pad($_);
    foreach (1..$episodes){ #loop for each episode
        my $ep=pad($_);
        
        print "$nameOfShow " if ($nameOfShow);
        print "S" . $s . "E" . $ep . " - \n";
        
  }
  print "\n";    #add space between seasons
}

exit 0;