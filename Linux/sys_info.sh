#!/bin/bash

output = $HOME/research/sys_info.txt

echo "The current date is $(date)" >> $output
echo "The operating system for this machine is $(uname)" >> $output
echo -e "The IP addres is $(ip addr | head -9 | tail -1)" >> $output
echo "The host name of this machine is $(hostname)" >> $output
echo ""
echo "A Quick System Audit Script" >> $output
date
echo ""
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $output
echo "Hostname: $(hostname -s) " >> $output

