#!/bin/bash

LOCAL_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

CMD="docker run -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=$LOCAL_IP --env ADVERTISED_PORT=9092 spotify/kafka"
echo $CMD

bash -c "$CMD"
