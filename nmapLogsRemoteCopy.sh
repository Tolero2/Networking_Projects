#!/bin/bash

#This script uses the SSH File transfer protocol (SCP) to move
#files/directory of Nmap logs (or any logs) from a remote host
#This script is intended for use with the Network Reconn script.
#------------------------------------------------------------------

##MOTD
echo "------------------------------------------"
echo       "Welcome to SSH Secure File(s) Copy"
echo "------------------------------------------"
echo "Description: 	
->This script copies the content of a
pre-defined Remote directory into a Local
directory location using SSH protocol.
->Change the absolute path of remote host 
statically by editing the 'remoteHost' 
variable in this script."
echo "-------------------------------------------"
##

##Fixed path to remote directory using SSH & 
#absolute(full) path 
#e.g. user@host/ip:/path/to/file
remoteHost=""
##

##check if remote location path is set
if [ -z "$remoteHost" ]
then
echo "YOU HAVE TO MANUALLY SET THE REMOTE PATH TO COPY FROM
      You can set the path by editing this script"
else   
###Take user defined path to a Directory to save copied file(s)
echo "Enter local directory path to copy Files into"
read localHost
##

##Secure copy (SCP) utitity for
#FILE/DIR COPY from a remote filestorage
scp "$remoteHost" "$localHost"
##

fi
