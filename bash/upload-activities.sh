#!/bin/bash
echo "Your token:" $1
shopt -s nullglob 
shopt -s nocaseglob
for file in *.{fit,FIT,tcx,TCX,gpx,GPX,ttbin,TTBIN,fitlog,FITLOG} ; do
    echo "Uploading file" $file 
    OUTPUT=$(curl -s --location --request POST 'https://runalyze.com/api/v1/activities/uploads' --header 'token: '$1 --form 'file=@'$file)
    if [[ $OUTPUT == *"No valid token"* ]]; then
	echo "token not valid"
	shopt -u nocaseglob
	shopt -u nullglob
	exit;
    fi
done

shopt -u nocaseglob
shopt -u nullglob
