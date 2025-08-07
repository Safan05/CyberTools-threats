# CyberTools-threats

## Overview

This repository contains open-source cybersecurity tools and malware samples for **educational and legal purposes only**. These tools are intended for security researchers, penetration testers, and cybersecurity professionals to understand attack vectors and improve defensive measures.

## ⚠️ Legal Disclaimer

**IMPORTANT**: This repository is intended for authorized use only. The developer, Abdallah Safan, is not responsible for any misuse, damage, or legal issues caused by the use of these tools. Users must:

- Only use these tools on systems they own or have explicit written permission to test
- Comply with all applicable local, state, and federal laws
- Use these tools responsibly and ethically
- Not use these tools for malicious purposes

## Repository Contents

### Malware Samples

#### 1. DES Ransomware (`DES.py`)
- **Type**: Ransomware simulation
- **Encryption**: AES-256 in CTR mode
- **Target**: Encrypts files in specified directory with `.enc` extension
- **GUI**: Tkinter-based ransom note interface
- **Decryption Key**: "Safan Hacked Me"
- **Purpose**: Educational demonstration of ransomware mechanics

**Features:**
- File and directory encryption
- GUI ransom note
- File decryption functionality
- Overwrites original files with encrypted versions

**installation:**
```bash
# Install required dependencies
pip install pycryptodome

# Clone the repository
git clone https://github.com/yourusername/CyberTools-threats.git
cd CyberTools-threats
```
### Tools

#### 1. HunterX (`hunterx.sh`)
- **Type**: Reconnaissance and vulnerability discovery
- **Purpose**: Automates subdomain enumeration, port scanning, HTTP probing, and takeover detection

**Features:**
- Uses `subfinder` and `assetfinder` for subdomain enumeration
- Filters and checks live HTTP/S targets with `httpx`
- Port scanning with `nmap`
- Detects potential subdomain takeovers with `subzy`
- Custom subdomain support and clean output files

**Installation:**
```bash
# Clone the repository
git clone https://github.com/yourusername/CyberTools-threats.git
cd CyberTools-threats

# Install required tools
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/LukaSikic/subzy@latest
sudo apt install nmap

#usage example
chmod +x hunterx.sh
./hunterx.sh example.com
```

## Usage Guidelines

1. **Testing Environment**: Always use these tools in isolated, controlled environments
2. **Virtual Machines**: Recommended to use VMs for testing malware samples
3. **Backup**: Always backup important data before testing
4. **Documentation**: Document all testing activities for learning purposes

## Credits

Developed with dedication and curiosity by Abdallah Safan
If you find this helpful, consider ⭐ starring the repo and sharing it with fellow learners!

## Contact

For questions, suggestions, or reporting issues, please create an issue in this repository.