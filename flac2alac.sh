#!/usr/local/bin/bash

exec 1> >(tee -a flac2alac.log) 2>&1

set -e
shopt -s globstar # must have right version of bash for this

echo "=== Converting flacs in `pwd` on `date` ===" \
        && for f in ./**/*.flac; do avconv -n -i "$f" -c:a alac "${f%.*}.m4a" && rm "$f"; done

if [ "$?" -eq 0 ]; then
        echo "Success!"
else
        echo "Failure!"
fi

