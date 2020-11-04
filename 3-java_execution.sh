#!/bin/bash
rep=$1

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