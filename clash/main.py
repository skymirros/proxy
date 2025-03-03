import requests
import os

# URL to download
url = "https://raw.githubusercontent.com/Johnshall/Shadowrocket-ADBlock-Rules-Forever/refs/heads/release/sr_top500_banlist.conf"

# Download the content
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Get the content as text
    content = response.text
    
    # Split the content by lines
    all_lines = content.splitlines()
    
    # Filter lines and extract middle part
    prefixes = ["DOMAIN-KEYWORD", "IP-CIDR", "DOMAIN-SUFFIX"]
    categorized_data = {prefix: set() for prefix in prefixes}  # Using set for automatic deduplication
    
    for line in all_lines:
        for prefix in prefixes:
            if line.startswith(prefix):
                parts = line.split(',')
                if len(parts) >= 2:
                    middle_part = parts[1].strip()
                    categorized_data[prefix].add(middle_part)  # Add to set (deduplicates automatically)
                break
    
    # Write deduplicated data to separate files in the current directory
    for prefix, data_set in categorized_data.items():
        filename = f"clash/{prefix.lower().replace('-', '_')}.txt"
        full_path = os.path.join(os.getcwd(), filename)  # Create full path in current directory
        with open(full_path, 'w') as file:
            for item in data_set:
                file.write(f"{item}\n")
        print(f"Wrote {len(data_set)} unique items to {full_path}")
    
    # Print statistics
    total_filtered = sum(len(data) for data in categorized_data.values())
    print(f"\nTotal lines processed: {len(all_lines)}")
    print(f"Total unique filtered items: {total_filtered}")
    
    # Print examples and statistics for each type
    print("\nStatistics and examples for each type:")
    for prefix, data_set in categorized_data.items():
        print(f"\n{prefix}:")
        print(f"  Unique items: {len(data_set)}")
        print("  Examples:")
        for item in list(data_set)[:3]:  # Print up to 3 examples
            print(f"    {item}")

else:
    print(f"Failed to download the content. Status code: {response.status_code}")