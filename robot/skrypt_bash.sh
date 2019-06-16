#!/bin/bash

ip address |grep inet |grep  -w "$1" | awk '{print $2}'  |cut -d/  -f1
