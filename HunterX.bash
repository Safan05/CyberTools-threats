#!/bin/bash
# HunterX - A Bash script to perform domain reconnaissance created by Abdallah Safan
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

DOMAIN="$1"
echo "Starting HunterX for domain: $DOMAIN"

SubdomainsFile="subdomains.txt"
HttpxFile="httpx.txt"
NmapFile="nmap.txt"#!/bin/bash
# HunterX - A Bash script to perform domain reconnaissance created by Abdallah Safan
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

DOMAIN="$1"
echo "Starting HunterX for domain: $DOMAIN"

SubdomainsFile="subdomains.txt"
HttpxFile="httpx.txt"
NmapFile="nmap.txt"
SubzyFile="subzy.txt"
LiveFile="live.txt"

echo "Gathering subdomains... using subfinder and assetfinder tool"
subfinder -d "$DOMAIN" -all --recursive > "$SubdomainsFile"
echo "Subdomains saved to $SubdomainsFile"
echo "$Domain" | assetfinder --subs-only >> "$SubdomainsFile"

# check if user want to add custom subdomains 
if [ -f "custom_subdomains.txt" ]; then
  echo "Adding custom subdomains from custom_subdomains.txt"
  cat custom_subdomains.txt >> "$SubdomainsFile"
fi

echo "Running httpx to save hosts results..."
httpx -l "$SubdomainsFile" -o "$HttpxFile"
# Filter live hosts
httpx -l "$SubdomainsFile" -mc 200,302,201,200,301,307 -o "$LiveFile"
echo "hosts results saved to $HttpxFile"



echo "Running nmap to scan for open ports..."
nmap -iL "$SubdomainsFile" -oN "$NmapFile"
echo "Nmap scan results saved to $NmapFile"

echo "Running subzy to find vulnerabilities..."
subzy --targets "$SubdomainsFile" --hide_fails --vuln  | grep -v -E "Akamai|xyz|available|\-" > "$SubzyFile"
echo "Vulnerabilities saved to $SubzyFile"

echo "HunterX reconnaissance completed."
SubzyFile="subzy.txt"
LiveFile="live.txt"

echo "Gathering subdomains... using subfinder and assetfinder tool"
subfinder -d "$DOMAIN" -all --recursive > "$SubdomainsFile"
echo "Subdomains saved to $SubdomainsFile"
echo "$Domain" | assetfinder --subs-only >> "$SubdomainsFile"

# check if user want to add custom subdomains 
if [ -f "custom_subdomains.txt" ]; then
  echo "Adding custom subdomains from custom_subdomains.txt"
  cat custom_subdomains.txt >> "$SubdomainsFile"
fi

echo "Running httpx to save hosts results..."
httpx -l "$SubdomainsFile" -title -status-code -tech-detect -location -ip -follow-redirects -o "$HttpxFile"
# Filter live hosts
httpx -l "$SubdomainsFile" -mc 200,302,201,200,301,307 -o "$LiveFile"
echo "hosts results saved to $HttpxFile"

echo "Running nmap to scan for open ports..."
nmap -iL "$SubdomainsFile" -oN "$NmapFile"
echo "Nmap scan results saved to $NmapFile"

echo "Running subzy to find vulnerabilities..."
subzy run --targets $SubdomainsFile --hide_fails --vuln  | grep -v -E "Akamai|xyz|available|\-" > "$SubzyFile"
echo "Vulnerabilities saved to $SubzyFile"

echo ""
echo "HunterX reconnaissance completed for domain: $DOMAIN"
echo "Output Files:"
echo " - Subdomains:      $SubdomainsFile"
echo " - HTTP info:       $HttpxFile"
echo " - Live Hosts:      $LiveFile"
echo " - Nmap Ports:      $NmapFile"
echo " - Takeover Vulns:  $SubzyFile"