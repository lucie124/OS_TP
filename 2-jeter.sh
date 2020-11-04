#!/bin/bash

function bred(){
    echo "\033[31m\033[01m$1\033[0m"
}

function green(){
    echo "\033[32m$1\033[0m"
}

if [ ! -d ~/poubelle ]; then
    mkdir ~/poubelle
fi

# consulter le fonctionnement
if [ $# -eq 0 ]; then
    echo "[fichier...] : jeter les fichiers"
	echo "-l : lister le contenu de la poubelle"
    echo "-s fichier chemin : placer le fichier de la poubelle a chemin "
    echo "-v : vider la poubelle"
    exit 0
# lister et vider la poubelle
elif [ $# -eq 1 ]; then
    case $1 in
        -l)
            cd ~/poubelle
            ls
            exit 0
            ;;
        -v)
            rm -rf ~/poubelle
            green "la poubelle est vidée." 
            exit 0
            ;;
        -s)
            bred "-s fichier chemin : placer le fichier de la poubelle a chemin "
            exit 0
            ;;
    esac
fi

#recuperer le fichier
if [ $1 == -s ]
    then
    # cd ~/poubelle
    if [ $# -ne 3 ]; then
        bred "commande invalide !"
        bred "please try: -s fichier chemin"
        exit 0
    else
        err=0
        if [ ! -e ~/poubelle/$2 ]; then
            bred "fichier $2 n'est pas dans la poubelle."
            err=1
        fi
        if [ ! -d $3 ]; then
            bred "le chemin $3 n'existe pas."
            err=1
        fi
        if [ $err -eq 1 ]; then
            exit 1
        fi
    fi
    mv ~/poubelle/$2 "$3"
    green "fichier $2 est récupéré dans la répertoire $3"
    exit 0
fi


#jeter les fichiers
for file in $*
do
    if [ ! -e $file ]; then
        bred "fichier $file n‘existe pas."
    elif [ -e ~/poubelle/$file ]; then
        DATE=$(date +\#%Y-%m-%d)
        pname="${file%.*}"
        extension="${file##*.}"
        newfile=$( echo $pname$DATE\.$extension)
        mv $file $newfile
        mv "$newfile" ~/poubelle
        green"fichier $file renommé comme $newfile est mis dans la poubelle."
    else
        mv "$file" ~/poubelle
        green "fichier $file est mis dans la poubelle."
    fi
done


