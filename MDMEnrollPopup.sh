#!/bin/bash

#Replace yourdomain on line 8 with your open enrollment link

if ( /usr/bin/profiles -P | /usr/bin/grep -q bushel ); then
  echo "Profile Exists"
else
  open -a safari https://yourdomain.bushel.com
fi
