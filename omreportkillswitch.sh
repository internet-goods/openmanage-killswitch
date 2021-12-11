#!/bin/bash
#Kill Switch using chassis temp 
temp=$(/opt/dell/srvadmin/bin/omreport chassis temps|grep Reading|awk '{ print $3}'|cut -d'.' -f1)
#disable condor killswitch
if [ $temp -gt 28 ]
  then #WARNING temps over 28C stop condor
    /etc/init.d/condor stop
fi
#shutdown node killswitch
if [ $temp -gt 32 ]
  then #CRITICAL temps over 32C shutdown node 
  /sbin/shutdown -h now 
fi
