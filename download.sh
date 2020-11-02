#!/bin/bash

if [ $# -lt 1 ]
then
  echo "please select a language code from the following:"
  declare -a LANGS=$(curl -is http://data.statmt.org/news-crawl/ | grep -Po "(?<==\")\w+(?=/)")
  echo $LANGS | sed 's/ /\n/g'
  exit 1
else
  LANG=$1
  echo "downloading news crawl in '$LANG'"
fi

DL_DIR="news-crawl"

if [ ! -d $DL_DIR ]
then
  mkdir $DL_DIR
fi

echo "downloading news crawl to '$DL_DIR/'"

wget \
  --continue \
  --recursive \
  --level 1 \
  --no-directories \
  --no-parent \
  --directory-prefix $DL_DIR \
  --span-hosts \
  --tries 1 \
  --accept .gz \
  -e robots=off \
  http://data.statmt.org/news-crawl/$LANG/
