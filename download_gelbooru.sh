#!/bin/bash

while read line; do
	idWithEnd=${line##*id=}
	id=${idWithEnd%%&*}
	apiurl="https://gelbooru.com/index.php?page=dapi&s=post&q=index&id="$id
	xml=$(curl -s $apiurl)
	fileUrlWithEnd=${xml##*file_url=\"}
	fileUrl=${fileUrlWithEnd%%\"*}
	curl -s $fileUrl -O
done < gelbooru.txt
