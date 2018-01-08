#!/bin/bash
for v in `cat courseslist.txt`
do 
   udacity-dl $v  > $v.log &
done 
