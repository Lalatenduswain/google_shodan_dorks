# Google-and-Shodan-Dorks Script

## Overview
This repository provides a powerful Bash script, **google_shodan_dorks.sh**, designed to simplify and automate advanced searches using Google Dorks and Shodan Dorks. These dorking techniques help in gathering sensitive information, identifying misconfigured services, and performing ethical reconnaissance.

## Features
- Perform advanced Google Dorking queries.
- Automate Shodan queries to find IoT devices, open ports, and exposed services.
- Save and organize query results in structured formats.

---

## Repository Details
- **Repository URL:** [https://github.com/Lalatenduswain/google_shodan_dorks](https://github.com/Lalatenduswain/google_shodan_dorks)
- **Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

---

## Prerequisites
Ensure your system meets the following requirements before running the script:

1. **Supported OS:** Linux (Debian/Ubuntu-based distributions recommended)
2. **Packages and Tools:**
   - `curl`
   - `jq`
   - `shodan`
   - `google-chrome-stable` (or any browser for manual validation)
3. **API Access:**
   - Shodan API key (obtainable from your Shodan account)
4. **Permissions:**
   - Administrative (`sudo`) privileges for installing missing dependencies.

Install the required packages:
```bash
sudo apt update && sudo apt install curl jq -y
```

Install the Shodan CLI:
```bash
pip install shodan
shodan init YOUR_SHODAN_API_KEY
```

---

## Script Description

### **Script Name:** `google_shodan_dorks.sh`

### **Script Purpose:**
This script performs automated searches based on Google Dorks and Shodan Dorks to identify potential vulnerabilities or exposed information.

### **Script Features:**
1. **Google Dorking Automation:**
   - Uses predefined Google Dork queries to search for specific file types, login pages, or exposed directories.
2. **Shodan Dorking Automation:**
   - Identifies IoT devices, open ports, and vulnerable systems using Shodan API queries.
3. **Result Management:**
   - Outputs results into categorized logs for easy reference.

---

## Clone the Repository
Clone the repository from GitHub to get started:
```bash
git clone https://github.com/Lalatenduswain/google_shodan_dorks.git
cd google_shodan_dorks
```

---

## Usage

Run the script as follows:

```bash
chmod +x google_shodan_dorks.sh
./google_shodan_dorks.sh
```

You will be prompted to enter:
- Specific search criteria for Google Dorks.
- Shodan API key if not already configured.

### Example Commands:
- Google Dorks:
  ```
  intitle:"login page" filetype:html
  site:example.com filetype:pdf
  ```
- Shodan Dorks:
  ```
  port:22 product:OpenSSH
  hostname:example.com
  ```

---

## Script Explanation

### Google Dorking Section
The script uses `curl` to perform advanced Google search queries and retrieves filtered results.

### Shodan Dorking Section
The script leverages the Shodan CLI and API to execute queries, filtering results based on your input.

### Output Format
Results are saved in the `results/` directory, organized by date and query type.

---

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

---

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

---

## Support or Contact

Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/google_shodan_dorks/issues).
