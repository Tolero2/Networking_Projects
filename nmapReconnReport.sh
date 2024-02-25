#!/bin/bash

#Hello User
user=$(whoami)
echo "Hello, $user"

##MOTD
echo "------------------------------------------------------"
echo "Welcome to a simple and interactive NMAP Port Scanner 
	  with a Web browser REPORT output."
echo "------------------------------------------------------"
##

##Inputs collector
###IP(s)
echo "Please enter IP range to scan"
echo "First IP:"
read FirstIP
echo "Last IP [ input a number between 0-255 ]:" 
read LastIP
##

###PORT(s)
echo "Enter Port range to scan"
echo "First Port:"
read FirstPort
echo "Last Port:"
read LastPort
##

###Timestamp for Events Logging/ convert date value into list timestamp property
Today=($(date))
##

###Enable user to set Directory path to log/save output
echo "Set Event LOGs path:"
echo "[please add a '/' at the end of the Directory name]"
read LogDir
LogFileName="$LogDir""$FirstIP"_Html-Report_"${Today[1]}-${Today[2]}-${Today[3]}-${Today[4]}-${Today[5]}".html
##

##NMAP TCP scan and XML output to current directory with time stamp variable.
###Other SCAN techniques: uncomment only ONE scan technique at a time for accurate scanning. 
#sudo nmap -sT -sU "$FirstIP"-"$LastIP" -p"$FirstPort"-"$LastPort" -oX ./XmlScanOutput.xml
#sudo nmap -Pn -T5 -A "$FirstIP"-"$LastIP" -p"$FirstPort"-"$LastPort" -oX ./XmlScanOutput.xml
sudo nmap -sS -sU -sV --script=vuln "$FirstIP"-"$LastIP" -p"$FirstPort"-"$LastPort" -oX ./XmlScanOutput.xml
##


##Convert NMAP's XML output to HTML (Human Readable) using 'xsltproc' (XML utiltity)
xsltproc ./XmlScanOutput.xml -o "$LogFileName"
##

##Quick Firefox preview uncomment only if you have a Morzilla Firefox App intalled.
#firefox"$LogFileName"
##
