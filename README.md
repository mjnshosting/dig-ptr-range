# dig-ptr-range
Dig a range of PTR records instead of one at a time. Give the three parameters of base of IP which is the first 3 octets and the start and end in the last octet. 

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

NO - ./dig-ptr-range.sh 4.2.2. 10 256

NO - ./dig-ptr-range.sh 4.2.2 .255 .256

## Breakdown
./dig-ptr-range.sh base start end

Base - First three octets with no trailing period before the last octect
Start - Starting range of the fourth octet with no period and a space between the "Base" and the "End" values.
End - Last in range of the fourth octet with no period and a space between the "Start" value.

**It should look something like this**
```bash
user@server:~$ ./dig-ptr-range.sh 4.2.2 10 15


START: 00:38:01.918584666


4.2.2.10 PTR
4.2.2.11 PTR
4.2.2.12 PTR test-record.Level3.net.
4.2.2.13 PTR
4.2.2.14 PTR
4.2.2.15 PTR


STOP: 00:38:02.230145896
```
## Explanation:

Its pretty easy to read and use the given output. Some things do need to be pointed out. 

	1. There is no prompting for each parameter to be entered. 
	2. No input sanitization. I might change or make it more tolerant...probably not. 
	3. This README took longer to write than this script but I believe some sort of manual is important. 
