#!/bin/bash
###############################################################################################
#       ,--.,--.   ,--.,--.   ,--.    ,------.                           ,--.                 #
#       |  | \  `.'  / |   `.'   |    |  .-.  \ ,--.,--.,--,--,--. ,---. `--',--,--,  ,---.   #
#  ,--. |  |  \     /  |  |'.'|  |    |  |  \  :|  ||  ||        || .-. |,--.|      \| .-. |  #
#  |  '-'  /   \   /   |  |   |  |    |  '--'  /'  ''  '|  |  |  || '-' '|  ||  ||  |' '-' '  #
#   `-----'     `-'    `--'   `--'    `-------'  `----' `--`--`--'|  |-' `--'`--''--'.`-  /   #
#                                                                 `--'               `---'    #
###############################################################################################
if [ ! -d "/data/logs/skynet-${DAOKEAPPUK}/dump" ]; then
  echo 'create folder 'dump''
  mkdir /data/logs/skynet-${DAOKEAPPUK}/dump
fi
pid=$(ps -ef | grep 'java' | grep -v grep | awk '{print $2}')
fileName=/data/logs/skynet-${DAOKEAPPUK}/dump/`date +%Y%m%d`$RANDOM.phrof
jmap -dump:format=b,file=$fileName $pid
tar -zcvf $fileName.tar.gz $fileName
rm -rf $fileName
cd /data/logs/skynet-${DAOKEAPPUK}/dump
du -ha
echo $fileName.tar.gz