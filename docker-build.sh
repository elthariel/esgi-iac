#! /bin/sh

docker build --build-arg USER_UID=`id -u` -t esgi-iac:latest .
