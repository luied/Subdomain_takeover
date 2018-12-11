#!/bin/bash
echo "Scanneando ips ate a porta 5000"
file="/home/limpo.txt"
while IFS= read line
do
        # display $line or do somthing with $line
	masscan -p1-5000 "$line" --max-rate 1000
done < "$file"
