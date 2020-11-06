#!/bin/bash
if [ $# -eq 0 ]; then
    echo "\033[31mPlease enter a repository\033[0m \033[37m"
    exit 2
fi
rep=$1
if [ ! -d $rep ]; then
    echo "\033[31m$rep is not a repository\033[0m \033[37m"
    exit 2
fi

if [ ! -d $rep/bin ]; then
    echo "\033[31m$rep/bin n'existe pas.\033[0m \033[37m"
else
    cd $rep/bin
    for file in $(ls)
    do
        case $file in
            *.class)
                pname="${file%.*}"
                echo "Executing $file ..."
                java $pname
                continue
                ;;
            *)
                continue
                ;;
        esac
    done
fi