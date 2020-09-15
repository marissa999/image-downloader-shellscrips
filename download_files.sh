#!/bin/bash

while read line; do
	curl -s $line -O
done < list.txt
