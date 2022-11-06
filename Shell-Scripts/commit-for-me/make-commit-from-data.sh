# make a shell script that will read the data file and create commit for each day in specified in each line
# usage: ./make-commit-from-data.sh filename.txt
# show usage if no arguments are given
if [ $# -eq 0 ]
  then
    echo "usage: ./make-commit-from-data.sh filename.txt"
    exit 1
fi

# get the filename
FILENAME=$1

# loop through the lines in the file
while read -r line; do
  # data format: timestamp: commits <\r>
  # get the timestamp and commits
  TIMESTAMP=$(echo $line | cut -d':' -f1)
  COMMITS=$(echo $line | cut -d':' -f2)

  # loop through the commits
  for i in {1..$COMMITS}
  do
    # create a commit for the current date
    GIT_COMMITTER_DATE=$TIMESTAMP git commit --date=$TIMESTAMP --allow-empty --quiet -m "commit for $TIMESTAMP"
  done

done < "$FILENAME"

