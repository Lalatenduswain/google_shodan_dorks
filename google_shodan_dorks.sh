#!/bin/bash

# Google-and-Shodan-Dorks Script
# Author: Lalatendu Swain | https://github.com/Lalatenduswain

# Ensure prerequisites are installed
check_prerequisites() {
  for cmd in curl jq shodan; do
    if ! command -v $cmd &>/dev/null; then
      echo "[ERROR] $cmd is not installed. Please install it before running this script."
      exit 1
    fi
  done
}

# Perform Google Dorking
google_dorking() {
  echo "\n[INFO] Starting Google Dorking..."
  echo "Enter your Google Dork query (e.g., 'intitle:\"index of\" filetype:pdf') or type 'exit' to skip:"
  read -r google_query

  if [[ "$google_query" == "exit" ]]; then
    echo "[INFO] Skipping Google Dorking."
    return
  fi

  results_dir="results/google_dorks"
  mkdir -p "$results_dir"
  output_file="$results_dir/results_$(date +%Y%m%d%H%M%S).txt"

  echo "[INFO] Executing Google Dork: $google_query"
  echo "[WARNING] Google may block repeated automated searches. Use responsibly."
  
  curl -sG --data-urlencode "q=$google_query" https://www.google.com/search > "$output_file"

  echo "[INFO] Results saved to $output_file"
}

# Perform Shodan Dorking
shodan_dorking() {
  echo "\n[INFO] Starting Shodan Dorking..."
  echo "Enter your Shodan query (e.g., 'port:22 product:OpenSSH') or type 'exit' to skip:"
  read -r shodan_query

  if [[ "$shodan_query" == "exit" ]]; then
    echo "[INFO] Skipping Shodan Dorking."
    return
  fi

  results_dir="results/shodan_dorks"
  mkdir -p "$results_dir"
  output_file="$results_dir/results_$(date +%Y%m%d%H%M%S).json"

  echo "[INFO] Executing Shodan Dork: $shodan_query"
  shodan search "$shodan_query" --fields ip_str,port,hostnames,org --limit 100 > "$output_file"

  echo "[INFO] Results saved to $output_file"
}

# Main Function
main() {
  echo "\n--- Google-and-Shodan-Dorks Script ---"
  echo "Author: Lalatendu Swain | https://github.com/Lalatenduswain\n"

  check_prerequisites

  echo "[INFO] Starting script..."

  # Create results directory
  mkdir -p results

  google_dorking
  shodan_dorking

  echo "\n[INFO] Script execution completed. Check the 'results/' directory for output."
}

# Execute main function
main
