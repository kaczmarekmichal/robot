#!/bin/bash

ip address |grep  -w "dynamic" | awk '{print $2}'  |cut -d/  -f1
