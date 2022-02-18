#!/bin/bash
#sed omits all output of IpInfo.sh except for lines contain 'IP Address' pattern
./IpInfo.sh | sed -n '/IP Address:/ P'
