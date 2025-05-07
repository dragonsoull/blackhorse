#!/usr/bin/env bash
#

declare -a sysinfo
sysinfo=(
  "Kernel Version: $(uname -r)"
  "OS Name: $(uname -o)"
  "OS Type: $(uname -m)"
  "Hostname: $(hostname)"
  "Uptime: $(uptime -p)"
  "CPU Info: $(lscpu | grep 'Model name')"
  "Memory Info: $(free -h | grep 'Mem')"
  "Disk Usage: $(df -h | grep '/$')"
)
# Print system information
for info in "${sysinfo[@]}"; do
  echo "$info"
done
# Print the number of CPU cores
cpu_cores=$(lscpu | grep '^CPU\(s\):' | awk '{print $2}')
echo "Number of CPU cores: $cpu_cores"
# Print the number of logical processors
logical_processors=$(lscpu | grep '^Thread\(s\) per core:' | awk '{print $4}')
echo "Number of logical processors: $logical_processors"
# Print the number of physical processors
physical_processors=$(lscpu | grep '^Socket\(s\):' | awk '{print $2}')
echo "Number of physical processors: $physical_processors"
# Print the CPU architecture
cpu_architecture=$(lscpu | grep '^Architecture:' | awk '{print $2}')
echo "CPU architecture: $cpu_architecture"
# Print the CPU model
cpu_model=$(lscpu | grep '^Model name:' | awk '{for(i=3;i<=NF;i++) printf $i " "; print ""}')

echo "CPU model: $cpu_model"
# Print the CPU speed
cpu_speed=$(lscpu | grep '^CPU MHz:' | awk '{print $3}')
echo "CPU speed: $cpu_speed MHz"
# Print the CPU cache size
cpu_cache_size=$(lscpu | grep '^L3 cache:' | awk '{print $3}')
echo "CPU cache size: $cpu_cache_size"
# Print the CPU flags
cpu_flags=$(lscpu | grep '^Flags:' | awk '{for(i=2;i<=NF;i++) printf $i " "; print ""}')
echo "CPU flags: $cpu_flags"
# Print the CPU vendor

