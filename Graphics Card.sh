#!/bin/sh
echo "<result>$(system_profiler SPDisplaysDataType | awk '/Chipset Model/,/graphics/{print}' | sed '$d;s/^ *//g')</result>"
