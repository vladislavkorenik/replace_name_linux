#!/bin/bash

oldNamesString=$(cat  ./fontawesome-names/old.txt |tr "\n" " ")
oldNamesArray=($oldNamesString)

newNamesString=$(cat  ./fontawesome-names/new.txt |tr "\n" " ")
newNamesArray=($newNamesString)


for (( i=0; i<=${#oldNamesArray[@]} - 1; i++ ))
do
  grep -E -w -Rl --exclude-dir={node_modules,_deprecated,assets,fontawesome} fa-${oldNamesArray[i]} ~/Public/Macmillan/*/{src,frontend} | xargs sed -i "s/${oldNamesArray[i]}/${newNamesArray[i]}/g"
done
