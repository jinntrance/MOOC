#!/bin/bash
#  pip3 install coursera-dl
for v in `cat courseslist.txt`
do 
   coursera-dl --curl -pl -n -- $v  > $v.log &
done 
