#!/bin/bash
PROJECT_NAME="github_action"
JAR_PATH="/home/ubuntu/github_action/build/libs/*.jar"
DEPLOY_PATH=/home/ubuntu/$PROJECT_NAME/
DEPLOY_LOG_PATH="/home/ubuntu/$PROJECT_NAME/deploy.log"
APPLICATION_LOG_PATH="/home/ubuntu/$PROJECT_NAME/application.log"
DEPLOY_ERR_LOG_PATH="/home/ubuntu/$PROJECT_NAME/deploy_err.log"
BUILD_JAR=$(ls $JAR_PATH)
JAR_NAME=$(basename $BUILD_JAR)

echo "배포 시작 : $(date)" >> $DEPLOY_LOG_PATH

echo "> build 파일명: $JAR_NAME" >> $DEPLOY_LOG_PATH
echo "> build 파일 복사" >> $DEPLOY_LOG_PATH
cp $BUILD_JAR $DEPLOY_PATH

echo "> 현재 동작중인 어플리케이션 pid 체크" >> $DEPLOY_LOG_PATH
CURRENT_PID=$(pgrep -f $JAR_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 동작중인 어플리케이션 존재 X" >> $DEPLOY_LOG_PATH
else
  echo "> 현재 동작중인 어플리케이션 존재 O" >> $DEPLOY_LOG_PATH
  echo "> 현재 동작중인 어플리케이션 강제 종료 진행" >> $DEPLOY_LOG_PATH
  echo "> kill -9 $CURRENT_PID" >> $DEPLOY_LOG_PATH
  kill -9 $CURRENT_PID
fi

DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
echo "> DEPLOY_JAR 배포" >> $DEPLOY_LOG_PATH
nohup java -jar -Dspring.profiles.active=local $DEPLOY_JAR --server.port=8081 >> $APPLICATION_LOG_PATH 2> $DEPLOY_ERR_LOG_PATH &

echo "> 배포 종료 : $(date)" >> $DEPLOY_LOG_PATH
