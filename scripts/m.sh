#!/bin/bash

str=$1
shift

while [[ $* != "" ]] 
do 
  str="${str}TRENNZEICHEN$1"
  shift
done

output=`m.rb $str`

eval $output
