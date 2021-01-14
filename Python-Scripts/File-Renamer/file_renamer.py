"""
I have a bunch of file with date in their names
eg: 2020_01_13_123510_file.php
Need to update the date of all the files using a pattern

****
Instruction:
put this script in the *Folder* where the files are kept
*folder*  should only have the  files that need reenamimg and this script

"""

import os
import re
import sys

# get path of currently running script 
script_path = os.path.realpath(sys.argv[0])

# get the directory 
directory = os.path.dirname(script_path)

#get all file name in that directory
files = os.listdir(directory)


"""
    test: Check if the renaming is working as wanted
    print array of file names
"""
def print_array(array):
    for val in array:
        print(val)


# number of files listed
total_files = len(files)

# removing the script name from list
if (files[total_files-1] in script_path):
    files.pop()


"""
    change date via regular expression
"""
# start_date = "2020_12_01_060035"
def chnage_date(file, year, month, date, time):
    return re.sub("\d{4}_\d{2}_\d{2}_\d{6}", str(year)+'_'+str(month)+'_'+str(date).zfill(2)+'_'+str(time).zfill(6), file)


"""
    rename the files
    sending year = 2020; month = 12; day as variable; time as variable
    4 files with same date, time -> second inceremtal way, jump next minute if at 59 second
"""
def rename(files):
    index = 0
    day = 1
    time = 201200
    for file in files:
        # ------ test -----
        # files[index] = chnage_date(file,2020,12,day,time)
        # ------ test -----
        os.rename((directory + '\\'+ file), (directory + '\\'+chnage_date(file, 2020, 12, day, time)))
        index += 1
        time += 1
        if(index%4==0):
            day += 1

        if ("59" in str(time)):
            time += 41



# ------ test -----
# rename(files)
# print_array(files)
# ------ test -----


# calling rename function
rename(files)
print(str(total_files-1)+" files renamed.")
