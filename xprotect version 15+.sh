#!/bin/bash

#thanks to Frasser Hess for sharing the script

result="Not found"
major_os=$(/usr/bin/sw_vers -productVersion | awk -F . '{print $1}')

if [[ ${major_os} -lt 15 ]]; then
  result="Not eligible"
else
  installed_version=$(/usr/bin/xprotect version | awk '/Version/ {print $2}')
  update_version=$(/usr/bin/xprotect check | awk '/version/ {print $NF}')
  if [[ ${update_version} -gt ${installed_version} ]]; then
    result="Update available: ${update_version}"
  fi
fi

echo "<result>${result}</result>"
