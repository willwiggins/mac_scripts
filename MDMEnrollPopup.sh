#!/bin/bash

if ( /usr/bin/profiles -P | /usr/bin/grep -q bushel ); then
  echo "Profile Exists"
else
  open -a safari https://sl.bushel.com
fi
