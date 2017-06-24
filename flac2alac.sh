#!/usr/local/bin/bash

set -e
shopt -s globstar

echo "=== Converting flacs in `pwd` on `date` ===" \
        && for f in ./**/*.flac; do avconv -n -i "$f" -c:a alac "${f%.*}.m4a" && rm "$f" |& tee -a flac2alac.log; done

if [ "$?" -eq 0 ]; then
        echo "Success!"
else
        echo "Failure!"
fi

