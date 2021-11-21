# CTF Tools

## Tools

### nmap

Port scanning.

```bash
nmap -sC -sV -oN outfile $iphost
nmap -v -A -p- $iphost
```

### amass

DNS enumeration.

TODO: add info

### gobuster

Directories enumeration:
```bash
gobuster -w wordlist -u http://domain.tld -x php,txt,etc
```

### hydra

Bruteforce attacks on various services:
```bash
hydra [-l $login/-L $loginlist] [-p $password/-P $passlist] $iphost
```

### metasploit

Open console and explore:
```bash
msfconsole
```

### sqlmap
```bash
sqlmap -u http://$ip/path
    --form -- auto parse form
    --data -- string sent via POST
    -a -- everything from db
    --dbs -- leak db names
    -D $db --tables -- leak db tables
    -D $db -T $table -- dump single table
```

### pwntools

Make your own python pwn script.

## Even more tools

- subfinder
- massdns
- masscan
- aquatone

## WinPEASS/LinPEASS

Privilege esacalation. Search scripts in `/opt/peass`.

## Encode/decode tools

- Python FU
- https://gchq.github.io/CyberChef/

## Password cracking tools

- john the ripper (not included)
- oclhashcat (not included)

## Exploit DBs

- getsploit (requires API key from vulners.com)
- searchsploit
- https://www.exploit-db.com

## SecLists

- https://github.com/danielmiessler/SecLists - use rockyou if unsure
- https://github.com/v0re/dirb/tree/master/wordlists

## Reverse shells

- http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet
