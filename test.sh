#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Testing Frontend..."
if curl -s --head http://localhost:3000 | grep "200 OK" > /dev/null; then
   echo -e "${GREEN}Frontend is working!${NC}"
else
   echo -e "${RED}Frontend test failed.${NC}"
fi

echo "Testing Backend..."
if curl -s --head http://localhost:3000 | grep "200 OK" > /dev/null; then
   echo -e "${GREEN}Backend is working!${NC}"
else
   echo -e "${RED}Backend test failed.${NC}"
fi
echo "Checking database connection..."
DB_OUTPUT=$(docker exec -it b205171c5295 mongosh --eval "show dbs" 2>&1)

if echo "$DB_OUTPUT" | grep -q "admin"; then
   echo -e "${GREEN}Database connection successful!${NC}"
else
   echo -e "${RED}Database connection failed.${NC}"
fi