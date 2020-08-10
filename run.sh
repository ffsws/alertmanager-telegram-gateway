#!/bin/bash

if [ "x" == "x$username" ]; then
  echo "warning: username is not set"
else
  echo "admin user is $username"
fi

if [ "x" == "x$password" ]; then
  echo "warning: password is not set"
else
  echo "password is set (not visible)"
fi

if [ "x" == "x$bottoken" ]; then
  echo "FAIL: bottoken is not set"
  exit 1
else
  echo "bottoken is set (not visible)"
fi

if [ "x" == "x$chatid" ]; then
  echo "FAIL: chatid is not set"
  exit 2
else
  echo "chatid is $chatid"
fi

sed -i s/botToken/"$bottoken"/ flaskAlert.py
sed -i s/xchatIDx/"$chatid"/ flaskAlert.py
sed -i s/XXXUSERNAME/"$username"/ flaskAlert.py
sed -i s/XXXPASSWORD/"$password"/ flaskAlert.py

export FLASK_APP=flaskAlert.py
/usr/bin/flask --host 0.0.0.0 --port 9119
