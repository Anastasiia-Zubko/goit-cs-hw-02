#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

> $log_file

for site in "${websites[@]}"
do
    http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$site")

    if [ "$http_status" -eq 200 ]; then
        echo "[$site] is UP" | tee -a $log_file
    else
        echo "[$site] is DOWN" | tee -a $log_file
    fi
done

echo "Результати перевірки записані у файл $log_file"
