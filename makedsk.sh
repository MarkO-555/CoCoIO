#!/bin/bash

set -x

DSK=cciowww.dsk

rm -f "${DSK}"
os9 format -e "${DSK}"


#!/bin/bash -x
os9 makdir "${DSK},CMDS"
os9 makdir "${DSK},WWW"
os9 makdir "${DSK},SYS"

# CCIO
for i in bufmath.b09  drawTable.b09  getBookmark.b09  initeth.b09  www.b09  getdns.b09  stateth.b09  drawTable.b09  gotoHost.b09  putBookmark.b09; do
	os9 copy "${i}" "${DSK},WWW/${i}" -l -r
done

# SYS
for i in hosts  interfaces; do
	os9 copy "SYS/${i}" "${DSK},SYS/${i}" -l -r
done

# CMDS
for i in mgw; do
 	os9 copy "CMDS/${i}" "${DSK},CMDS/${i}"
	os9 attr "${DSK},CMDS/${i}" -e -pe
done

os9 copy README.md "${DSK},README.md" -l -r

echo "cocoio-tools $(date +%Y%m%d-%H%M%S)" >/tmp/version.txt
os9 copy /tmp/version.txt "${DSK},version.txt" -l -r


 
