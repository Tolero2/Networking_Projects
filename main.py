

#Simple Interactive Netwoerk Reconnaisance script

##This is an ABSTRACT -------------------------------------------------------------------------------------#
#Reminder: All python NMAP packages need the NMAP utility installed on any sytem
#that will run the python NMAP packages.
#This script require the NMAP's python module.
#You can add this module to your environment using the pip python-nmap command.
#Full privilege may be required to complete some scan types.
#Inputs are still handled loosely; be careful with your inputs. 
#Results are diplayed in comma separated values (CSV), allows for easy parsing.
##---------------------------------------------------------------------------------------------------------#
import nmap

#instantiator
nm=nmap.PortScanner()

#Messgae of the day (MOTD)
print("Welcome to the Interactive NMAP Recon Tool")
print("\n!==============================================!")

#User Inputs
ip_address = input("Please enter an IP address: ")
print (f'The IP you entered is: {ip_address}')

#-----------------------------------------------------------------------------------------------------------------------------------------------------#
def port_default (default=None):
	port_default = input("Enter a port to scan or press enter to scan with default: ")
	if port_default:
		port = str(port_default)
		print (f'The port you entered is: {port}')
	else:
		port= '1-1024'
		print ('The default port range is 1-1024')
	return port
	
try:
	port_search=port_default()
except: 
	print("Enter a valid port number!") 
	port_default()


#---------------------------------------------------------------------------------------------------#	
	
#User input to choose scan type
query_type = input("""\n 
Please select a type of scan to perform.
Use associated number.
   1 - Host Discovery (ping)
   2 - TCP Stealth port Scan
   3 - UDP Scan
   4 - TCP/UDP Service Application and Version
   5 - Vulnerabilities San
   6 - All Scan
\n""")
	

def scan_output(scan_result): #Display Result of any search type dynamically
	if query_type=='1':
		print(f'NMAP Version: {nm.nmap_version()}')
		print(f'NMAP stats: {nm.scanstats()}')
	else:
		print(f'NMAP Version: {nm.nmap_version()}')
		print(f'NMAP stats: {nm.scanstats()}')
		print(f'Scan info: {nm.scaninfo()}')
		#print(f'Scan Result:  {nm[ip_address].items()}')
		scan_result=nm.csv()
		print(f'Scan Result:  {scan_result}')
		
		
def scan_query(ip_addr, port):
	query_num=int(query_type)
	
	#Scan types(in no.) and their respective NMAP query to run
	if query_num >= 1 and query_num <= 6: #query entry validation
		
		if query_type=='1': #Ping
			print(f'you have selected Host Discovery scan')
			scan=nm.scan(hosts=ip_addr,arguments='-sn -v',timeout=30)
			scan_output(scan)
		elif query_type=='2': #TCP SYN packet scan
			print(f'you have selected TCP stealth scan ')
			scan=nm.scan(hosts=ip_addr,ports=port,arguments='-sS -v',sudo=True,timeout=10)
			scan_output(scan)
		elif query_type=='3': #UDP scan
			print(f'you have selected UDP Scan ')
			nm.scan(hosts=ip_addr,ports=port,arguments='-sU -v',sudo=True,timeout=15)
			scan_output(scan)
		elif query_type=='4': #Application Name and Version scan
			print(f'you have selected TCP/UDP Services App Version scan ')
			scan=nm.scan(hosts=ip_addr,ports=port,arguments='-sV -sU -sT -v',sudo=True,timeout=90)
			scan_output(scan)
		elif query_type=='5': #Use all Vulnerabilty scripts to scan Services and Version
			print(f'you have selected Vulnerability scan ')
			scan=nm.scan(hosts=ip_addr,ports=port,arguments='-sV -v --script=vuln',sudo=True,timeout=60)
			scan_output(scan)
		else: #complete scan including all of the above and OS scan 
			print(f'you have selected All scan ')
			scan=nm.scan(hosts=ip_addr,ports=port,arguments='-A -v',sudo=True)
			scan_output(scan)

try:
		scan_query(ip_address,port_search)
	
except: 
		print("Input a valid number between 1-6!\n")
		query_type
		scan_query(ip_address,port_search)

finally:	
	pass
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
				
	



