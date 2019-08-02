#!/bin/sh
while [ 1 ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-4 -n 1)
   D=`date -Iseconds`
   case "$I" in
      "1") echo "$D PUT /card/checkout HTTP/1.0 200 2326"
      ;;
      "2") echo "$D POST /card/add?product=car HTTP/1.0 200 6842"
      ;;
      "2") echo "$D POST /card/add?product=bike HTTP/1.0 200 6842"
      ;;
      "4") echo "$D GET /card/remove?product=bike HTTP/1.0 200 2326"
      ;;
   esac
done
