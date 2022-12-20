#!/bin/bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN_ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

path=""

if [ -z "$1" ]; then
  path="."
else
  path="$1"
  path="${path%/}"
fi

pathdepth=$(echo "${path}" | grep -o '/' | wc -l)

find "${path}" -type d | while IFS= read -r dir; do
  echo "${dir}" | find "${dir}" -mindepth 1 -maxdepth 1 -type f | wc -l | { IFS= read -r N;
      depth=$(echo "${dir}" | grep -o '/' | wc -l)
      let "depth=depth-pathdepth"
      format=""
      for((i=0;i<$depth;i++)); do
        format="${format}    "
      done
      format="${format}|__"
      if(($N>0)); then
        echo -e "${format} ${LIGHT_BLUE}${dir##*/}${NC} [${N} files]"
      else
        echo -e "${format} ${LIGHT_BLUE}${dir##*/}${NC}"
  fi; };
done

echo ""
