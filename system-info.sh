#!/bin/bash

# Color Codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
# Internet Connectivity Check
echo -e "${BLUE}Checking Internet Connection...${NC}"

if ping -c 1 google.com &> /dev/null
then
    echo -e "${GREEN}✓ Internet Connection: Connected${NC}"
else
    echo -e "${RED}✗ Internet Connection: Not Connected${NC}"
fi

echo ""

echo -e "${BLUE}"
echo "========================================"
echo "     Linux System Information"
echo "========================================"
echo -e "${NC}"

echo -e "${GREEN}Hostname:${NC} $(hostname)"
echo -e "${GREEN}Current User:${NC} $(whoami)"
echo -e "${GREEN}Private IP Address:${NC} $(hostname -I | awk '{print $1}')"
echo -e "${GREEN}Operating System:${NC} $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo -e "${GREEN}Kernel Version:${NC} $(uname -r)"
echo -e "${GREEN}Architecture:${NC} $(uname -m)"
echo -e "${GREEN}System Uptime:${NC} $(uptime -p)"

echo
echo -e "${YELLOW}CPU Information${NC}"
lscpu | grep "Model name"

echo
echo -e "${YELLOW}Memory Usage${NC}"
free -h

echo
echo -e "${YELLOW}Disk Usage${NC}"
df -h /

echo
echo -e "${YELLOW}IP Address${NC}"
hostname -I

echo
echo -e "${GREEN}Current Date & Time:${NC} $(date)"

echo
echo -e "${BLUE}========================================"
echo "       Script Executed Successfully"
echo "========================================"
echo -e "${NC}"
