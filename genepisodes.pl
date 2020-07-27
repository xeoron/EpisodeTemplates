#!/usr/bin/perl
# Name: genEpisodes.pl
# Author: Jason Campisi
# Date: 7/26/2020
# Purpose: Generates a season and episode list template
# License: Released under GPL v2 or higher. Details here http://www.gnu.org/licenses/gpl.html

use strict;
use Getopt::Long;

my ($season, $episodes,$nameOfShow, $dScenes, $help) = (0,0,0,0,0);
GetOptions("s:s"  =>\$season, "e:s" =>\$episodes, "d:s" =>\$dScenes, "n=s" =>\$nameOfShow, "help" =>\$help);

sub check(){ # check required data or if help was called
  if ($help or ($season <=0 or $episodes <=0)){ 
  print <<EOD;
GenEpisodes Generates a season and episode list template
    Ussage:        gen_episodes.pl -s=number -e=number
    
        -s=value   Number of Seasons you want to list 
        -e=value   Number of Episodes you wish to have per season
    
    Optional:
        -d=value        Number of Deleted Scenes Per Season    
        -n=showName     This will place the name before the each episode line 
        -help
        
Example: gen_episodes.pl -s=2 -e=2 n=Nuts -d=1
Nuts S01E01 -
Nuts S01E02 -
Nuts S01E03 - Deleted Scenes 

Nuts S02E01 -
Nuts S02E02 -
Nuts S02E03 - Deleted Scenes 

EOD
    exit 0;    
  }
}#end Check

check();

foreach(1..$season){ #loop for each season
    my $s=$_;
    foreach (1..$episodes){ #loop for each episode
        my $ep=$_;
        print "$nameOfShow " if ($nameOfShow);
        printf("S%02dE%02d - \n", $s, $ep);
    }
    
    foreach ($episodes..($episodes + $dScenes -1)){
        print "$nameOfShow " if ($nameOfShow);
        printf("S%02dE%02d - Deleted Scenes\n", $s, $_);
    }
    print "\n";    #add space between seasons
}

exit 0;