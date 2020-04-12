#!/bin/bash
echo "origin: $1"
cbr_file=$1

IFS="
"

tempdir=$(mktemp -d)
echo $tempdir

filename=$(basename "$cbr_file")
filename_without_extension="${filename%.*}"
cp "$cbr_file" $tempdir/"${filename}".rar
mkdir $tempdir/"${filename_without_extension}"
unrar x $tempdir/"${filename}".rar $tempdir/"${filename_without_extension}"

zip -rj $tempdir/"${filename_without_extension}".zip $tempdir/"${filename_without_extension}"/*

cp $tempdir/"${filename_without_extension}".zip "${cbr_file%.*}".cbz

rm -rf $tempdir
