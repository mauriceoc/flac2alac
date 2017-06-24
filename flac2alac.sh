#!/usr/local/bin/bash

set -e
shopt -s globstar

echo "=== Converting flacs `date` ===" \
        && for f in ./**/*.flac; do avconv -n -i "$f" -c:a alac "${f%.*}.m4a" && rm "$f" |& tee -a flac2alac.log; done


