#!/bin/sh -e

# all unix line endings
dos2unix *.txt
# convert to 7-bit ASCII
perl -C -MText::Unidecode -n -i -e'print unidecode($_)' *.txt
# remove all underscores
perl -pi -e 's/_//g' *.txt

