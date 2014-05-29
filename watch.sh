#!/usr/bin/env bash
last=$(date +%s)
coffee -w -o lib coffee \
| sed -u -e "s#- compiled $(pwd)/coffee/##" \
| while read IN
do 
  now=$(date +%s)
  echo "$IN"
  ((ago=now - last))
  if [ $ago -gt 10 ]
  then
    coffeelint coffee/$(echo $IN | sed -u -e 's/.* //')
    cake test && last=$now
  fi
done
