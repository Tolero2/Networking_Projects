#!/bin/bash

#This script uses the SSH File transfer protocol (SCP) to move
#files/directory of Nmap logs (or any logs) to a remote host
#This script is intended for use with the Network Reconn script.
#-------------------------------------------------------------------

##MOTD
echo "-------------------------------------------"
echo    "Welcome to SSH Secure File(s) Transfer"
echo "--------------------------------------------"
echo "Description: 	
->This script transfers the content of a
pre-defined Remote directory into a Local
directory location using SSH protocol.
->Change the absolute path of remote host 
statically by editing the 'remoteHost' 
variable in this script."
echo "-------------------------------------------"
##

##Fixed path to remote directory using SSH & 
#absolute(full) path 
#[set the below] eg. user@host/ip:path/to/file
remoteHost=""
##

##check if remote location path is set
if [ -z "$remoteHost" ]; then
echo "YOU HAVE TO MANUALLY SET THE REMOTE PATH TO TRANSFER INTO"
echo "Edit this script and set [remoteHost] to"
echo "continue."
else
###Take user defined path to a File/Directory for transfer
echo "Enter path to location of File(s) or"
echo "Files(s) or Directory(/dir/*)"
echo "to transfer"
read copyPath
echo "$copyPath"
##

##Secure copy (SCP) utitity for 
#FILE/DIR TRANSFER to a remote filestorage
scp $copyPath "$remoteHost"
##

fi
