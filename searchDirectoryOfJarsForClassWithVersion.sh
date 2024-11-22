#!/usr/bin/env bash
# The version is the file version according to https://javaalmanac.io/bytecode/versions/
# example execution:  bash searchDirectoryOfJarsForClassWithVersion.sh 65
# The above example is searching for a jar that has a class with java 21 classes
VERSION=$1
for i in *.jar;
do
  unzip "${i}" -d "${i}_dir" >/dev/null 2>&1 # unzip/jar  jar file into directory named after jar file
  if eval find "${i}_dir" -name "*.class" -exec hexdump -s 7 -n 1 -e '" %d "' {} \; | grep " $VERSION " >/dev/null 2>&1  ; # hexdump is the quickest way to read the class version
    then  echo "Found class with version ${VERSION}  in jar: ${i}."
  else
    echo "No class in jar: ${i} has version: ${VERSION}."
  fi
done
