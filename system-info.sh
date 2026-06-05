#!/bin/bash

echo "System Information"
echo "------------------"

echo "Hostname:"
hostname

echo ""

echo "Current User:"
whoami

echo ""

echo "Current Date and Time:"
date

echo ""

echo "Disk Usage:"
df -h

echo ""

echo "Memory Usage:"
free -h
