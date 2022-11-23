#!/bin/bash

oldNamesString=$(cat  ./fontawesome-names/old.txt |tr "\n" " ")
oldNamesArray=($oldNamesString)

newNamesString=$(cat  ./fontawesome-names/new.txt |tr "\n" " ")
newNamesArray=($newNamesString)

fileNameWithOldIconPaths='output.txt'

for (( i=0; i<=${#oldNamesArray[@]} - 1; i++ ))
do
  grep -E -w -Rl --exclude-dir={node_modules,_deprecated,assets,fontawesome} fa-${oldNamesArray[i]} ~/Public/Macmillan/*/frontend ~/Public/Macmillan/*/src > output.txt
  wait
  
  for path in `cat $fileNameWithOldIconPaths`; do
    sed -i "s/${oldNamesArray[i]}/${newNamesArray[i]}/g" $path
    wait
  done
  wait
done



