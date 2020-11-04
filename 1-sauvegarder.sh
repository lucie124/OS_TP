#!/bin/bash

#if no OLD - create one
if [ ! -d "./OLD" ]; then
  mkdir OLD
fi

#put all documents of current rep in OLD
for fname in $(ls)
do
    case $fname in
        OLD)
            continue
            ;;
        *)
            cp -r $fname ./OLD
            ;;
    esac
done

cd OLD
DATE=$(date +\#%Y-%m-%d)

#rename all files
for file in `find . `
do
    if [ -d "$file" ] # is a repository
        then
        continue
    else # not a repository
        pname="${file%.*}"
        extension="${file##*.}"
        newfile=$( echo $pname$DATE\.$extension)
        mv $file $newfile
    fi
done

#rename all repositories
for file in `find . -type d` # all repositories
do
    newfile=$( echo $file$DATE)
    mv $file $newfile 2> /dev/null
done
