#!/bin/bash

file=$1

case $file in
    *.java)
        break
        ;;
    *)
        echo "\033[31m Entree incorrecte \033[0m \033[37m"
        exit 2
        ;;
esac



tc=$( javac $file 2>&1 | wc -l )

if [ $tc -eq 0 ]; then
    echo "\033[32m$file : compilé \033[37m"
    exit 0
else
    echo "\033[31m$file : non compilé \033[0m \033[37m"
    exit 1
fi