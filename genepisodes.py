#!/usr/bin/env python
# Name: genEpisodes.pl
# Author: Jason Campisi
# Date: 7/26/2020
# Purpose: Generates a season and episode list template
# License: Released under GPL v2 or higher. Details here http://www.gnu.org/licenses/gpl.html
"""
GenEpisodes Generates a season and episode list template
    Ussage:        gen_episodes.py -s number1 -e number2
    
        --s value   Number of Seasons you want to list 
        --e value   Number of Episodes you wish to have per season
    
    Optional:
        --d value   Number of Deleted Scenes Per Season
        showName    This will place the name before the each episode line 
        --help, -h
        
Example: gen_episodes.py --s 2 --e 2 Nuts --d 1
Nuts S01E01 -
Nuts S01E02 -
Nuts S01E03 - Deleted Scenes

Nuts S02E01 -
Nuts S02E02 -
Nuts S02E03 - Deleted Scenes
"""

import argparse
parser = argparse.ArgumentParser(description='Generate A Seasons/Epsisode Template List!' )
parser.add_argument('--s', nargs=1, type=int, help="Number of Seasons", required=True) 
parser.add_argument('--e', nargs=1, type=int, help="Number of Episodes", required=True)
parser.add_argument('--d', nargs=1, help="Number of Deleted Scenes")
parser.add_argument('show', nargs='?', help="Name of Show")


seasons = parser.parse_args().s[0]
episodes = parser.parse_args().e[0]
deletedScenesCount = 0 if (parser.parse_args().d is None) else int(parser.parse_args().d[0])
nameOfShow = "" if (parser.parse_args().show is None) else parser.parse_args().show

print ('Delete Scene Total = '+ f'{deletedScenesCount:02}')

sCount=1
while seasons >= sCount:  #loop for each season
    epCount=1
    while episodes >= epCount: #loop for each episode #
        if len(nameOfShow) > 0:
            print (nameOfShow, end =" ") 
        print ('S' + f'{sCount:02}' + 'E'+ f'{epCount:02}'+ ' - ')
        epCount +=1
    epTotal = epCount + deletedScenesCount
    while epCount < epTotal:    #if there are deleted scenes... list them
        if len(nameOfShow) > 0:
            print (nameOfShow, end =" ")         
        print ('S' + f'{sCount:02}' + 'E'+ f'{epCount:02}'+ ' - Deleted Scenes ')
        epCount +=1
    print ("")    #add space between seasons
    sCount +=1

quit()
