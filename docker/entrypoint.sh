#!/bin/bash
cd /data
makepkg -C
find src -exec chmod u+rw {} \;
