#!/bin/bash

echo "Start all QA Server" &

echo "Start Selenium Grid" &
java -jar /Users/macminiaiutomation/web-manager-device-automation/src/devicesLab/selenium-server-standalone-3.5.3.jar -role hub &

echo "Start STF" &
rethinkdb &
sleep 6 &&
stf local --public-ip 192.168.0.25 &


echo "Start Appium server" &
appium -a 192.168.0.25 -p 4723 --nodeconfig /Users/macminiaiutomation/web-manager-device-automation/src/devicesLab/node-device-galaxyS6.json -U 04157df4e5fa702d &
appium -a 192.168.0.25 -p 4724 --nodeconfig /Users/macminiaiutomation/web-manager-device-automation/src/devicesLab/node-device-galaxyS5.json -U 56e76b47 &
appium -a 192.168.0.25 -p 4725 --nodeconfig /Users/macminiaiutomation/web-manager-device-automation/src/devicesLab/node-device-iPhone6.json -U 4da23ae53de505738e174774b010885c7e04275a &
appium -a 192.168.0.25 -p 4726 --nodeconfig /Users/macminiaiutomation/web-manager-device-automation/src/devicesLab/node-device-nexus5.json -U 0d1633d302b3cbf0 &
appium -a 192.168.0.25 -p 4727 --nodeconfig /Users/macminiaiutomation/web-manager-device-automation/src/devicesLab/node-device-J7.json -U 3100a21bdb30b30d &

cd /Users/macminiaiutomation/WebDriverAgent && ./Scripts/build-socket.sh &&
sleep 6 &&
cd /Users/macminiaiutomation/WebDriverAgent && ./Scripts/start-server.sh &
sleep 6 &&
xcodebuild test -workspace /Users/macminiaiutomation/WebDriverAgent/WebDriverAgent.xcworkspace -scheme WebDriverAgentRunner -destination "platform=iOS Simulator,OS=11.2,name=iPhone 8 Plus"

