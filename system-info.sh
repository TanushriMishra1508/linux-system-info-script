#!/bin/bash

# ============================================
# Linux System Information Script
# Author: Tanushri Mishra
# ============================================

# Color Codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Report File
REPORT="system_report.txt"

# Start Report
cat > "$REPORT" << EOF
=========================================
      Linux System Information Report
Generated on: $(date)
=========================================

EOF

# Header
echo -e "${BLUE}"
echo "==========================================="
echo "       Linux System Information"
echo "==========================================="
echo -e "${NC}"

# Internet Connectivity
echo -e "${YELLOW}Internet Connectivity${NC}"

if ping -c 1 google.com &> /dev/null
then
    STATUS="Connected"
    echo -e "${GREEN}Status:${NC} Connected"
else
    STATUS="Not Connected"
    echo -e "${RED}Status:${NC} Not Connected"
fi

echo "Internet Connectivity : $STATUS" >> "$REPORT"
echo

# Hostname
HOST=$(hostname)
echo -e "${GREEN}Hostname:${NC} $HOST"
echo "Hostname : $HOST" >> "$REPORT"

# Current User
USER_NAME=$(whoami)
echo -e "${GREEN}Current User:${NC} $USER_NAME"
echo "Current User : $USER_NAME" >> "$REPORT"

# Operating System
OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
echo -e "${GREEN}Operating System:${NC} $OS"
echo "Operating System : $OS" >> "$REPORT"

# Kernel Version
KERNEL=$(uname -r)
echo -e "${GREEN}Kernel Version:${NC} $KERNEL"
echo "Kernel Version : $KERNEL" >> "$REPORT"

# Architecture
ARCH=$(uname -m)
echo -e "${GREEN}Architecture:${NC} $ARCH"
echo "Architecture : $ARCH" >> "$REPORT"

# System Uptime
UPTIME=$(uptime -p)
echo -e "${GREEN}System Uptime:${NC} $UPTIME"
echo "System Uptime : $UPTIME" >> "$REPORT"

# Private IP
IP=$(hostname -I | awk '{print $1}')
echo -e "${GREEN}Private IP Address:${NC} $IP"
echo "Private IP Address : $IP" >> "$REPORT"

echo

# CPU Information
echo -e "${YELLOW}CPU Information${NC}"
CPU=$(lscpu | grep "Model name" | sed 's/Model name:[[:space:]]*//')
echo "$CPU"
echo "CPU : $CPU" >> "$REPORT"

echo

# Memory Usage
echo -e "${YELLOW}Memory Usage${NC}"
free -h
MEMORY=$(free | awk '/Mem:/ {printf "%.2f%%", $3/$2*100}')
echo "Memory Used : $MEMORY" >> "$REPORT"

echo

# Disk Usage
echo -e "${YELLOW}Disk Usage${NC}"
df -h /
DISK=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk Used : $DISK" >> "$REPORT"

echo

# System Load
echo -e "${YELLOW}System Load${NC}"
LOAD=$(uptime | awk -F'load average:' '{print $2}')
echo "$LOAD"
echo "System Load : $LOAD" >> "$REPORT"

echo

# Logged-in Users
echo -e "${YELLOW}Logged-in Users${NC}"
who
echo "Logged-in Users:" >> "$REPORT"
who >> "$REPORT"

echo

# Last Boot Time
echo -e "${YELLOW}Last Boot Time${NC}"
who -b
echo "Last Boot Time:" >> "$REPORT"
who -b >> "$REPORT"

echo

# Date & Time
DATE_TIME=$(date)
echo -e "${GREEN}Current Date & Time:${NC} $DATE_TIME"
echo "Current Date & Time : $DATE_TIME" >> "$REPORT"

echo
echo -e "${BLUE}===========================================${NC}"
echo -e "${GREEN}System report generated successfully!${NC}"
echo -e "${GREEN}Saved as: ${YELLOW}$REPORT${NC}"
echo -e "${BLUE}===========================================${NC}"
