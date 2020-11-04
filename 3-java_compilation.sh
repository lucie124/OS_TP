#!/bin/bash
rep=$1
mkdir $rep/bin 2> /dev/null

for file in $( find . -name "*.java")
do
    echo "Compiling $file"
    sh javac_test.sh $file
    pname="${file%.*}"
    mv $pname.class $rep/bin 2> /dev/null
done

