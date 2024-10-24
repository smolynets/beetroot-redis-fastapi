#!/bin/bash

echo "Request to /ping endpoint:"
curl -X 'GET' \
  'http://backend:8000/ping' \
  -H 'accept: application/json'
echo -e "\n"

echo "Request to /redis/set endpoint with str value string:"
  curl -X 'POST' \
    'http://backend:8000/redis/set/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
    "key": "string",
    "value": "string"
    }'
echo -e "\n"

echo "Request to /redis/keys endpoint:"
curl -X 'GET' \
  'http://backend:8000/redis/keys/' \
  -H 'accept: application/json'
echo -e "\n"

echo "Request to /redis/exists/{key} endpoint with unexist value:"
curl -X 'GET' \
  'http://backend:8000/redis/exist/wrong' \
  -H 'accept: application/json'
echo -e "\n"

echo "Request to /redis/exists/{key} endpoint with exist value:"
curl -X 'GET' \
  'http://backend:8000/redis/exist/string' \
  -H 'accept: application/json'
echo -e "\n"

echo "Request to /redis/set endpoint with int value 1:"
  curl -X 'POST' \
    'http://backend:8000/redis/set/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
    "key": "counter",
    "value": 1
    }'
echo -e "\n"

echo "Request to /redis/incr/ endpoint:"
   curl -X 'POST' \
    'http://backend:8000/redis/incr/?key=counter' \
    -H 'accept: application/json' \
    -d ''
echo -e "\n"

echo "Request to /redis/incrby endpoint with str value string:"
  curl -X 'POST' \
    'http://backend:8000/redis/incrby/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
    "key": "counter",
    "value": "string"
    }'
echo -e "\n"

echo "Request to /redis/incrby endpoint with int value 2:"
  curl -X 'POST' \
    'http://backend:8000/redis/incrby/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
    "key": "counter",
    "value": 2
    }'
echo -e "\n"

echo "Request to /redis/delete endpoint:"
  curl -X 'DELETE' \
    'http://backend:8000/redis/delete/?key=string' \
    -H 'accept: application/json'
echo -e "\n"


echo "All checks done!"
