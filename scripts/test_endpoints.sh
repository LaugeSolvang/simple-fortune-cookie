#!/bin/bash

# Function to test an endpoint
test_endpoint() {
  local endpoint="$1"
  local method="$2"
  local data="$3"
  local sleep_duration=${4:-5}

  sleep $sleep_duration
  if [ "$method" = "POST" ]; then
    RESPONSE=$(curl -s -o /dev/null -w '%{http_code}' -X POST -H "Content-type: application/json" -d "$data" "$endpoint")
  else
    RESPONSE=$(curl -s -o /dev/null -w '%{http_code}' "$endpoint")
  fi

  if [ "$RESPONSE" -ne 200 ]; then
    echo "Failed on endpoint $endpoint with method $method. HTTP response code: $RESPONSE"
    exit 1
  else
    echo "Successfully hit the endpoint $endpoint with method $method. HTTP response code: $RESPONSE"
  fi
}

# Test endpoints
test_endpoint "http://localhost:8080/api/random" "GET"
test_endpoint "http://localhost:8080/api/add" "POST" '{"message":"Test Fortune"}'
