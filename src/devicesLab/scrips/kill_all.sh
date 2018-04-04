#!/bin/bash

echo "Kill all" &

echo "Kill Selenium Grid" &
ps aux | grep selenium | awk '{print $2}' | xargs kill -9 &

echo "Kill STF" &
ps aux | grep rethinkdb | awk '{print $2}' | xargs kill -9 &
ps aux | grep stf | awk '{print $2}' | xargs kill -9 &


echo "Kill Appium server" &
ps aux | grep 4723 | awk '{print $2}' | xargs kill -9 &
ps aux | grep 4724 | awk '{print $2}' | xargs kill -9 &
ps aux | grep 4725 | awk '{print $2}' | xargs kill -9 &
ps aux | grep 4726 | awk '{print $2}' | xargs kill -9 &
ps aux | grep 4727 | awk '{print $2}' | xargs kill -9 &


ps aux | grep build-socket | awk '{print $2}' | xargs kill -9 &
ps aux | grep start-server | awk '{print $2}' | xargs kill -9 &
ps aux | grep -i WebDriverAgent | awk '{print $2}' | xargs kill -9