#!/bin/bash

local_ip=$(cat local_ip.txt)
public_ip=$(curl ifconfig.me)

nmap 10.0.2.*


echo "local ip: $local_ip"
nmap --script vuln $local_ip 

echo "public ip: $public_ip"
nmap $public_ip
