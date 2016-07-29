#! bin/bash

curl -L -H 'Content-Type: application/json' -X POST -d @sample.json 192.168.65.141:18400/scheduler/dependency 
