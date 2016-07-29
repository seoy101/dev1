#! /bin/bash

curl -L -H 'Content-Type: application/json' -X POST -d @docker.json 192.168.65.141:18400/scheduler/iso8601 
