#!/bin/sh

# 
# PlanAhead(TM)
# runme.sh: a PlanAhead-generated Runs Script for UNIX
# Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/mooselliot/Desktop/14.7/ISE_DS/EDK/bin/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/ISE/bin/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/common/bin/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/PlanAhead/bin
else
  PATH=/home/mooselliot/Desktop/14.7/ISE_DS/EDK/bin/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/ISE/bin/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/common/bin/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/PlanAhead/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/mooselliot/Desktop/14.7/ISE_DS/EDK/lib/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/ISE/lib/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/common/lib/lin64
else
  LD_LIBRARY_PATH=/home/mooselliot/Desktop/14.7/ISE_DS/EDK/lib/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/ISE/lib/lin64:/home/mooselliot/Desktop/14.7/ISE_DS/common/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep xst -ifn "mojo_top_0.xst" -ofn "mojo_top_0.srp" -intstyle ise
