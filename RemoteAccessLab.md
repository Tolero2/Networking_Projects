# CONFIGURE REMOTE ACCESS TO A SERVER MACHINE

## Objective

The objective of this project was to gain a comprehensive understanding of SSH (Secure Shell) agent configurations, including server and client setups, and delve into the workings of Public/Private Keys authentication. Furthermore, the aim was to establish secure remote access to administer configurations and settings on hosted VMs, even when physically distant from the server location. Additionally, the project aimed to explore various methods to harden SSH security for practical usage over the internet, ensuring robust protection against potential threats and unauthorized access attempts.

### Skills Learned

- Advanced understanding of networking concepts
- Proficiency in configuring and securing SSH services
- Knowledge of Linux system administration
- Knowledge of network security practices
- Virtualization concepts

### Tools Used

- Virtualization software (UTM) for hosting Linux VMs
- OpenSSH service for remote access
- Intergrated Router for network configuration and port mapping

## Steps

### Tasks

- Hosting Linux Distros (Kali & Mate) VMs on my Mac OS X based system.
- Created SSH service on my hosted VM and Mac OS system.
- Configure SSH access over my home LAN.
- Seggregate Host server machine on a different IP network from LAN.
- Configure Remote acess over the *internet* (Enable ISP Gateway port mapping on home router).

#### Steps Taken to Harden Security on My SSH

- Added layer of security through my router; by placing my internet exposed Mac system on a segregated network in my LAN.
- Generated RSA encryption private/public keys for SSH keys authentication.
- Configured SSH **Identity Key** on SSH client and **Authorized_keys** on SSH server to enable SSH keys login.
- Explicitly turned off any password/no-password login to prevent brute-force attacks on my SSH server.
- Configured my SSH to communicate on an irregular port to prevent my system from appearing open on generic (22) port scans over the internet.
