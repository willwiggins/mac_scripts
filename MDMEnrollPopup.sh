#!/bin/bash

if [ profiles -P | grep -c bushel -ne 0]; then
  echo "Profile Exists"
else
  echo "Profile does not exist"
fi
