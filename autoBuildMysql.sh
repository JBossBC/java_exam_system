#!/bin/bash

## author:蒋析洋

## auto build and create the mysql database accouding to the mysql.dockerfile
docker --version
if [ ! $? ]
then
  echo "attempt the download the docker,support the yum package manager util"
  yum install docker-ce
  if [ $? != 0 ]
  then
    echo "docker download failed,please download the docker by yourself"
    exit 1
  fi
  exit
fi
#inspect you have the schema.sql file

if [ ! -e schema.sql ]
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

imageID=`docker build -f ./mysql.dockerfile -t jiangxiyang/exam_system_database .| grep 'Successfully built'| awk '{print $NF}'`
if [[ ! -n ${imageID} ]]
then
  echo 'Cant get the create ImageID,you can appoint the imageID'
  read -p "input the imageID" imageID
  if [[ ! -n ${imageID} ]]
  then
    echo "exit the program"
    exit 1
  fi
fi
echo "the creating imageID is ${imageID}"
# run the docker container
if [ ! -e "/var/lib/examData" ]
then
  echo "creating the /var/lib/examData folder for persistence"
  mkdir -p /var/lib/examData
  if [  $? != 0 ]
  then
    echo 'Creating the /var/lib/examData failed,program exit'
     exit 1
  fi
else
  echo "the volume about the persistence mysql data to /var/lib/examData"
fi
docker run -p 3306:3306 -it -v /var/lib/examData:/var/lib/mysql ${imageID}
if [ $? != 0  ]
then
   echo 'running the docker container failed,please scan the docker log'
   exit 1
fi

echo 'congratulating you creates the docker container successfully'





# create the docker container









