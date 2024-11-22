#!/usr/bin/env bash
# This script is helpful for determining if some jar contains a shaded version of a class. Happens way more often then it should.
# example execution searchDirectoryOfJarsForClassName.sh Gson.class
# output :

#Searching current directory for class/file name: Gson.class...
#(standard input): 23616 Fri Feb 11 11:14:32 PST 2022 com/google/gson/Gson.class
#Found class in gson-2.9.0.jar jar file.

CLASS_NAME=$1
echo "Searching current directory for class/file name: $CLASS_NAME..."
for i in *.jar;
do
  jar -tvf "$i" | grep -Hsi "$CLASS_NAME"  && echo "Found class in $i jar file.";
done
