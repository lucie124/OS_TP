#!/bin/bash
MYDIR=$( pwd)
if [ $# -eq 0 ]; then
    echo "\033[31mPlease enter a repository\033[0m \033[37m"
    exit 2
fi
rep=$1
if [ ! -d $rep ]; then
    echo "\033[31m$rep is not a repository\033[0m \033[37m"
    exit 2
fi
cd $rep
mkdir bin 2> /dev/null

for file in $( find . -name "*.java")
do
    echo "Compiling $file"
    sh $MYDIR/javac_test.sh $file
    pname="${file%.*}"
    mv $pname.class ./bin 2> /dev/null
done

