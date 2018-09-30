#!/bin/bash
rm ./drone_secret.secret
touch ./drone_secret.secret
chmod 600 ./drone_secret.secret
echo -n "DRONE_SECRET=" > ./drone_secret.secret
dd if=/dev/urandom bs=540 count=1 2> /dev/null | base64  >> ./drone_secret.secret
