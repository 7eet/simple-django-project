#!/bin/bash

#building image from dockerfile
sudo docker build -f Dockerfile.test -t 7eet/testing-project . 

#running the test inside docker image and storing the logs inside a file
sudo docker run 7eet/testing-project > resultOfPythonTest 2>&1

#reading the lastline of file 
finalResult=$(tail -1 resultOfPythonTest )
#echo "$finalResult"

if [ "$finalResult" == "OK" ];
then
	echo "Test Passed Now Creating Production Image"
	sudo docker build -t 7eet/production-project . 
	exit 0
else
	echo "Test Failed"
	exit 10
fi
