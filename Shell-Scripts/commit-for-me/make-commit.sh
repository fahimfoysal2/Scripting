# a shell script that will create a commit for each day
# in the specified range
# usage: ./make-commit.sh 2015-01-01 2015-12-31

# show usage if no arguments are given
if [ $# -eq 0 ]
  then
    echo "usage: ./make-commit.sh 2015-01-01 2015-12-31"
    exit 1
fi

# get the start and end dates
START_DATE=$1
END_DATE=$2

# get the current date
CURRENT_DATE=$START_DATE

# loop through the dates
while [ "$CURRENT_DATE" != "$END_DATE" ]; do
  # create a commit for the current date
  GIT_COMMITTER_DATE=$CURRENT_DATE git commit --date=$CURRENT_DATE --allow-empty --quiet -m 'commit for $CURRENT_DATE'
  # increment the current date
  CURRENT_DATE=$(date -I -d "$CURRENT_DATE + 1 day")
done

# create a commit for the end date
GIT_COMMITTER_DATE=$CURRENT_DATE git commit --date=$CURRENT_DATE --allow-empty --quiet -m 'commit for $CURRENT_DATE'
