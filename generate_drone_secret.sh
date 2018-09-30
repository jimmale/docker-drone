#!/bin/bash
echo -n "DRONE_SECRET=" > ./drone_secret.env
dd if=/dev/urandom bs=72 count=1 | base64  >> ./drone_secret.env
