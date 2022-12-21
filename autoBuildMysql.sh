#!/bin/bash

## auto build and create the mysql database accouding to the mysql.dockerfile
if [ ! 'docker --version' ]
then
  exit
fi
#inspect you have the exam.sql file

if [ ! -e exam.sql ]
then
  echo "you cant have the exam.sql file"
  exit
fi

# inspect you have the mysql.dockerfile file
if [ ! -e mysql.dockerfile ]
then
  echo "you cant have the mysql.dockerfile file"
  exit
fi

imageID=`docker build -f ./mysql.dockerfile -t jiangxiyang/exam_system_database .| grep 'Successfully built'|awk '{print $NF}'`

if [[ -n ${imageID} ]]
then
  echo 'Cant get the create ImageID,you can appoint the imageID'
  read -p "input the imageID" imageID
  if [[ -n $imageID ]]
  then
    echo "exit the program"
    exit
  fi
fi

# run the docker container
if [ ! -e "/var/lib/examData" ]
then
  echo "creating the /var/lib/examData folder for persistence"
  if [ ! `mkdir -r /var/lib/examData` ]
  then
    echo 'Creating the /var/lib/examData failed,program exit'
     exit
  fi
else
  echo "the volume about the persistence mysql data to /var/lib/examData"
fi
if [ ! `docker run -p 3306:3306 -it -v /var/lib/examData:/var/lib/mysql  ` ]
then
   echo 'running the docker container failed,please scan the docker log'
   exit
fi

echo 'congratulating you creates the docker container successfully'





# create the docker container









