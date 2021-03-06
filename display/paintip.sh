#! /bin/bash

# script that will show the IP in the display
# 2018-06-18

#ip="192.168.4.1"
ip=$(/home/pi/displaytools/getip)
echo $ip

# move cursor to first position
echo -en '\x76' > /dev/ttyAMA0 
sleep 1

# Clear display null null null null
echo -en '\x78\x78\x78\x78' > /dev/ttyAMA0

  A="$(cut -d'.' -f1 <<<"$ip")"
  B="$(cut -d'.' -f2 <<<"$ip")"
  C="$(cut -d'.' -f3 <<<"$ip")"
  D="$(cut -d'.' -f4 <<<"$ip")"

  # Show values
  echo "$A"
  echo "$B"
  echo "$C"
  echo "$D"
  echo "- printing in display now... -"

  OUTPUT=$(/home/pi/displaytools/numToHex $A)
  echo -en $OUTPUT > /dev/ttyAMA0
  sleep 1

  OUTPUT=$(/home/pi/displaytools/numToHex $B)
  echo -en $OUTPUT > /dev/ttyAMA0
  sleep 1

  OUTPUT=$(/home/pi/displaytools/numToHex $C)
  echo -en $OUTPUT > /dev/ttyAMA0
  sleep 1

  OUTPUT=$(/home/pi/displaytools/numToHex $D)
  echo -en $OUTPUT > /dev/ttyAMA0
  sleep 1

  echo -en '\x78\x78\x78\x78' > /dev/ttyAMA0

  #echo "$C"
  #echo -en '\x76\x78\x78\x78\x78' > /dev/ttyAMA0 # move to first position and clear display
  #echo -en '\x76\x03\x04\x05\x06' > /dev/ttyAMA0

  #sleep 2
  #echo "$D"
  #echo -en '\x76\x78\x78\x78\x78' > /dev/ttyAMA0 # move to first position and clear display
  #echo -en '\x76\x04\x05\x06\x07' > /dev/ttyAMA0

  echo "This is the end!"
