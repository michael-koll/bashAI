#!/bin/bash

API_ENDPOINT="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent"
API_KEY="API_KEY" # Replace with your API key

if [ -z "$1" ]; then
  echo "Usage: <input> | $0 \"Your question..."
  exit 1
fi

PROMPT="You are a commandline tool and you get your input via a pipe! Structure your answer in a way it can be piped into further tools! Don't use markdown!"

INPUT_DATA=$(cat)

QUESTION="$*"

JSON_PAYLOAD=$(jq -n \
  --arg prompt "$PROMPT" \
  --arg question "$QUESTION" \
  --arg input "$INPUT_DATA" \
  '{
    contents: [{
      parts: [{text: ($prompt + " " + $question + " " + $input)}]
    }]
  }')

RESPONSE=$(curl -s -X POST "$API_ENDPOINT?key=$API_KEY" \
  -H "Content-Type: application/json" \
  -d "$JSON_PAYLOAD")

if [ $? -ne 0 ]; then
  echo "Error: Failed to communicate with the API."
  exit 1
fi

ANSWER=$(echo "$RESPONSE" | jq -r '.candidates[0].content.parts[0].text // "Error: Unable to parse response."')
echo "$ANSWER"