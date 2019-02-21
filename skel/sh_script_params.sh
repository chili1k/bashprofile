#!/bin/bash

my_dir="$(dirname "$0")"
my_name=$(basename "$0")

die() {
  echo "[EXIT] $@" 1>&2
  exit 1
}

printusage() {
  cat <<EOF
Usage: ${my_name}

This is how you use this script.


OPTIONS:
  -o --option        Option is easy to use.
  -n --noption       Noption is hard to use. Really hard!

  -h --help          This help message.

EOF
}

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
  -o|--option)
  OPTIONSET=true
  ;;
  -n|--nooption)
  NOOPTIONSET=true
  PARAM=$2
  ;;
   -h|--help)
  printusage
  exit 0
  ;;
  *)
  printusage # unknown option
  exit 0
  ;;
esac
shift # past argument or value
done

