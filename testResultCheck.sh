#!/bin/bash

#building image from dockerfile
sudo docker build -t 7eet/TestingProject .

#running the test inside docker image and storing the logs inside a file
sudo docker run 7eet/TestingProject > resultOfPythonTest 2>&1

#reading the lastline of file 
finalResult=$(tail -1 resultOfTest )
#echo "$finalResult"

if [ "$finalResult" == "OK" ];
then
	echo "Test Passed Now Push Image to Docker Hub"
	exit 0
else
	echo "Test Failed"
	exit 10
fi
