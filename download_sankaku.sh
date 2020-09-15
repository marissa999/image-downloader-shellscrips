#!/bin/bash

while read line; do
	id=$(echo $line | rev | cut -d"/" -f 1 | rev | cut -d"?" -f 1)
	dlurl=$(curl -s "https://capi-v2.sankakucomplex.com/posts?lang=en&page=1&limit=1&tags=id_range:$id" -H "User-Agent: chrome" | jq -r ".[0].file_url")
	curl -s $dlurl -e $line -H "User-Agent: chrome" -O
done < sankaku.txt
