#!/bin/sh
set -e

ls -all /usr/src/app

# Functions
help() { 
  echo "Options"
  echo "  "
  echo "  -h, output usage information"
  echo "  -a, arrival rate (DEFAULT: 60) - requests per second"
  echo "  -d, duration (DEFAULT: 25) - time of the test in seconds"
  echo "  -o, output e.g. result.json or /usr/src/app/result.json"
  echo "  -f, file location e.g. https://test.com/url.csv"
  exit 1;
}

# Defaults
export DURATION=60
export ARRIVAL_RATE=25
export OUTPUT='result.json'

while getopts ":a:d:f:o:" opt; do
  case ${opt} in
    a) 
      export ARRIVAL_RATE=${OPTARG}
      ;;
    d) 
      export DURATION=${OPTARG}
      ;;
    f) 
      export FILE=${OPTARG}
      ;;
    o) 
      export OUTPUT=${OPTARG}
      ;;
    \?) 
      help; exit 1
      ;;
  esac
done

echo ""
echo "Get test urls from $FILE"
curl -s -o urls.csv $FILE
echo ""
echo "Run test with ARRIVAL_RATE $ARRIVAL_RATE for $DURATION s and save the file to $OUTPUT"
echo ""
artillery run -e artillery artillery-web.yml -o $OUTPUT