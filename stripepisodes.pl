#!/usr/bin/perl
#Name: stripEpsidoes
#Author: Jason Campisi
#Date: 7/10/2020
#Purpose Reset episode lists to just have the episode info. Exmple "S01E01 -" 
# License: Released under GPL v2 or higher. Details here http://www.gnu.org/licenses/gpl.html

use strict;
use Fcntl;
use constant LOCK_UN => '8'; #close
use constant LOCK_EX => '2'; #open for reading

my @result; 
while (my $file=shift @ARGV){
	@result=();
    if (open (DATA,"<$file")){  until (flock(DATA, LOCK_EX)){ sleep .10; }  }
	else {  print " Error--Could not read the file $file: $!\n"; next; } 

	foreach(<DATA>){

       if( m/^\s*(S\d+E\d+\s-\s*)\S/ ){#capture only episode numbers
            $result[++$#result]=$1 . "\n";
       }else{ 
            $result[++$#result]=$_; #if all is well, keep it
       }
       
	}#end foreach
	flock (DATA, LOCK_UN);
    
    foreach (@result){ print "$_"; } #display to screen

    undef @result;
}#end while