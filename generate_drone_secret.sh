#!/bin/bash
echo -n "DRONE_SECRET=" > ./drone_secret.secret
dd if=/dev/urandom bs=72 count=1 2> /dev/null | base64  >> ./drone_secret.secret
