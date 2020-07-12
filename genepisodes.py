#!/usr/bin/env python
# Name: genEpisodes.pl
# Author: Jason Campisi
# Date: 7/12/2020
# Purpose: Generates a season and episode list template
# License: Released under GPL v2 or higher. Details here http://www.gnu.org/licenses/gpl.html
"""
GenEpisodes Generates a season and episode list template
    Ussage:        gen_episodes.pl -s=number -e=number
    
        -s=value   Number of Seasons you want to list 
        -e=value   Number of Episodes you wish to have per season
    
    Optional:
        -n=showName     This will place the name before the each episode line 
        -help
        
Example: gen_episodes.pl -s=2 -e=3 n=Nuts
Nuts S01E01 -
Nuts S01E02 -
Nuts S01E03 -

Nuts S02E01 -
Nuts S02E02 -
Nuts S02E03 -
"""

import argparse
parser = argparse.ArgumentParser(description='Generate A Seasons/Epsisode Template List!' )
parser.add_argument('--s', nargs=1, type=int, help="Number of Seasons", required=True) 
parser.add_argument('--e', nargs=1, type=int, help="Number of Episodes", required=True)
parser.add_argument('show', nargs='?', help="Name of Show")

seasons = int(parser.parse_args().s[0])
episodes = int(parser.parse_args().e[0])
nameOfShow = "" if (parser.parse_args().show is None) else parser.parse_args().show

sCount=1
while seasons >= sCount:  #loop for each season
    epCount=1
    while episodes >= epCount: #loop for each episode #
        if len(nameOfShow) > 0:
            print (nameOfShow, end =" ") 
        print ('S' + f'{sCount:02}' + 'E'+ f'{epCount:02}'+ ' - ')
        epCount +=1
    print ("")    #add space between seasons
    sCount +=1

quit()