#! /bin/bash

# file: setup.sh

# This bash script performs any setup necessary in order to test your entry.
# It is run only once, before running any other code belonging to your entry.

# Install the WFDB Toolbox for MATLAB and Octave
unzip sources/wfdb-app-toolbox-*.zip

# Configure the toolbox to use the custom native library built on Debian Wheezy
sed -i 's/WFDB_CUSTOMLIB=0;/WFDB_CUSTOMLIB=1;/' ./mcode/wfdbloadlib.m

OCTAVE='octave --quiet --eval '
STR="${OCTAVE} \"cd('mcode');addpath(pwd);savepath;quit;\""
echo "$STR"
eval ${STR}

OCTAVE='octave --quiet --eval '
STR="${OCTAVE} \"cd('sources');addpath(pwd);savepath;quit;\""
echo "$STR"
eval ${STR}

STR="${OCTAVE} \"addpath(genpath('sources/DeepLearnToolbox-master'));savepath;quit;\""
echo "$STR"
eval ${STR}

#STR="${OCTAVE} \"pkg prefix ~ ~;pkg local_list ~/.octave_packages;pkg install general-1.3.2.tar.gz;quit;\""
#echo "$STR"
#eval ${STR}


#STR="${OCTAVE} \"pkg prefix ~ ~;pkg local_list ~/.octave_packages;pkg install specfun-1.1.0.tar.gz;quit;\""
#echo "$STR"
#eval ${STR}

#STR="${OCTAVE} \"pkg prefix ~ ~;pkg local_list ~/.octave_packages;pkg install control-2.6.2.tar.gz;quit;\""
#echo "$STR"
#eval ${STR}

#STR="${OCTAVE} \"pkg prefix ~ ~;pkg local_list ~/.octave_packages;pkg install signal-1.2.2.tar.gz;quit;\""
#echo "$STR"
#eval ${STR}


#STR="pkg load signal"
#echo "$STR" >> ~/.octaverc
stty sane
