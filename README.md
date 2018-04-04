# dig-ptr-range
Dig a range of PTR records  instead of one 
Give the three parameters of base of IP which is the first 3 octets and the start and end in the last octet. 

Example: ./dig-ptr-range.sh 4.2.2 1 256

## Special Thanks to:
Jose P.

## Story/Purpose/Objective:
Customer contacts the NOC and we need to test and provide proof that our work after a DNS PTR record change has been completed. This is ok for a small block but what about an entire /24. This is quick and can be reused so you dont have to edit enter repeat the command. No lie it could be a one liner as well but this is cleaner and i can add to it later. 

## Requirements:

Install the "dig" or its parent package from your OS's repo. This script was written on and tested on a Ubuntu system.

## Simple Instructions (non git clone):
nano dig-ptr-range.sh - copy and paste the code from the file in this repo. Then press ctrl+x then ‘y’ then ‘Enter’. Finally make the file executable 
```bash
chmod +x dig-ptr-range.sh
```
## Run Example: 

YES - ./dig-ptr-range.sh 4.2.2 10 256

YES - ./dig-ptr-range.sh 4.2.2 255 256

NO - ./dig-ptr-range.sh 4.2.2. .10 256

NO - ./dig-ptr-range.sh 4.2.2 .255 .256

## Breakdown
./dig-ptr-range.sh base start end

Base - First three octets with no trailing period before the last octect
Start - Starting range of the fourth octet with no period and a space between the "Base" and the "End" values.
End - Last in range of the fourth octet with no period and a space between the "Start" value.

# It should look something like this. 

On device FastEthernet0/7 route C 192.168.21.0/27 is directly connected belongs to customer Cust007:Bond-Networks-London:DIA

On 192.168.61.1 Vlan07 route C 192.168.21.192/28 is directly connected belongs to customer Cust007-T1

On r0.ga.mjnshosting.com GigabitEthernet2/1 route C 192.168.38.0/24 is directly connected belongs to customer Cust07-29-16:Jason-Bourne-Services

On edge-r0.colo1.ga.mjnshosting.com !!Please Investigate Manually!! route S 192.168.21.224/27 [1/0] via 192.168.32.20 belongs to customer !!Please Investigate Manually!!

On coredevice1000 Null0 route S 192.168.1.31/32 is directly connected belongs to customer

On 11.20.85.30 Null0 route S 192.168.26.4/32 is directly connected belongs to customer

#Explanation:

##Output Structure:

On <device name from device-list> <interface on device> route <route from device that contains our desired blick> belongs to customer <customer/interface description for interface on device>

Its pretty easy to read and use the given output. Some things do need to be pointed out. 

	1. Only Connected (C), Static (S), Local (L) routes are shown. We only need to see where blocks are routed so edge devices are good but sometimes all devices may be best for backbone devices that have 10GE customers. 

	2. If there is no interface as you can see with the Static (S) route the script will output "!!Please Investigate Manually!!" in place of the interface name since one is not given. 

		On edge-r0.colo1.ga.mjnshosting.com !!Please Investigate Manually!! route S 192.168.21.224/27 [1/0] via 192.168.32.20 belongs to customer !!Please Investigate Manually!!

	3. If there is no output for "sh int <interface> | i escription" on the deivce then nothing will be printed. You will see this on Null0 interfaces like the example shown below. 

		On 11.20.85.30 Null0 route S 192.168.26.4/32 is directly connected belongs to customer
