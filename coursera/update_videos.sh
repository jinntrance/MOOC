#!/bin/bash
for v in `cat courseslist.txt`
do 
   ./coursera-dl/coursera-dl --curl -pl -n -- $v  > $v.log &
done 
