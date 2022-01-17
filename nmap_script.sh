#!/bin/bash

echo '--------------------------------------------------------------------------------------------------'

#pipelining 

figlet -t -k -f slant Nmap Scans Script | lolcat -S 2 -a -s 50

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[21mScan [1] or Search[2]\e[1;m'

read menu_choice

echo '--------------------------------------------------------------------------------------------------'

if [ $menu_choice -eq 1 ]; then

echo -e '\e[1;31mENTER PROJECT NAME\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

read project_name

echo '--------------------------------------------------------------------------------------------------'

if [ ! -d ~/reports/$project_name ]; then

mkdir ~/reports/$project_name

mkdir ~/reports/$project_name/nmap_scan

fi

echo -e '\e[1;31mENTER DOMAIN: \e[1;m'

echo '--------------------------------------------------------------------------------------------------'

read param

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[33m1.SERVICE VERSION NMAP\e[1;m'
echo -e '\e[33m2.TLS VERSION NMAP\e[1;m'
echo -e '\e[33m3.OS DETECTION NMAP\e[1;m'
echo -e '\e[33m4.AGRESSIVE NMAP\e[1;m'
echo -e '\e[33m5.VERBOSE AGRESSIVE NMAP\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mCHOOSE SCAN TYPE: \e[1;m'

echo '--------------------------------------------------------------------------------------------------'

read choice

echo '--------------------------------------------------------------------------------------------------'

if [ $choice -eq 1 ]; then

echo -e '\e[5mScript running!!!!\e[1;m'

nmap -sV $param  >> ~/reports/$project_name/nmap_scan/service-version-nmap.txt

clear

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mRESULTS:\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

cat ~/reports/$project_name/nmap_scan/service-version-nmap.txt | grep -i --color=always -e 'open' 

echo '--------------------------------------------------------------------------------------------------'

elif [ $choice -eq 2 ]; then

echo -e '\e[5mScript running!!!!\e[1;m'

nmap --script ssl-enum-ciphers -p 443 www.$param  >> ~/reports/$project_name/nmap_scan/tls-version-nmap.txt

clear

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mRESULTS:\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

cat ~/reports/$project_name/nmap_scan/tls-version-nmap.txt | grep -i --color=always -e 'TLSv' -e 'open' 

echo '--------------------------------------------------------------------------------------------------'

elif [ $choice -eq 3 ]; then

echo -e '\e[5mScript running!!!!\e[1;m'

sudo nmap -O $param  >> ~/reports/$project_name/nmap_scan/os-detection-nmap.txt

clear

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mRESULTS:\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

cat ~/reports/$project_name/nmap_scan/os-detection-nmap.txt | grep -i --color=always -e 'OSScan' -e 'OS CPE' -e 'Aggressive OS guesses'

echo '--------------------------------------------------------------------------------------------------'

elif [ $choice -eq 4 ]; then

echo -e '\e[5mScript running!!!!\e[1;m'

nmap -A $param  >> ~/reports/$project_name/nmap_scan/agressive-nmap.txt

clear

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mRESULTS:\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

cat ~/reports/$project_name/nmap_scan/agressive-nmap.txt | grep -i --color=always -e 'open' -e 'http-server-header' -e 'http-title' -e 'ssl-cert' -e 'valid'


echo '--------------------------------------------------------------------------------------------------'

elif [ $choice -eq 5 ]; then

echo -e '\e[5mScript running!!!!\e[1;m'

nmap -vv -A $param  >> ~/reports/$project_name/nmap_scan/verobse-agressive-nmap.txt

clear

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mRESULTS:\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

cat ~/reports/$project_name/nmap_scan/agressive-nmap.txt | grep -i --color=always -e 'open' -e 'http-server-header' -e 'http-title' -e 'ssl-cert' -e 'valid'

echo '--------------------------------------------------------------------------------------------------'

else

echo -e '\e[31mCHOOSE CORRECT OPTION:\e[1;m' 

fi

elif [ $menu_choice -eq 2 ]; then

clear

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mEnter project_name: \e[1;m'

echo '--------------------------------------------------------------------------------------------------'

read search_name

echo '--------------------------------------------------------------------------------------------------'

ls -ltrh ~/reports/$search_name/nmap_scan

echo '--------------------------------------------------------------------------------------------------'

echo -e '\e[31mWHICH SCAN RESULTS TO VIEW? Server Version[1],TLS Version[2],OS[3],Aggro[4],Verbose Aggr[5]\e[1;m'

echo '--------------------------------------------------------------------------------------------------'

read search_choice

echo '--------------------------------------------------------------------------------------------------'

if [ $search_choice -eq 1 ];then

cat ~/.reports/$search_name/nmap_scan/service-version-nmap.txt | grep -i --color=always -e 'open'

elif [ $search_choice -eq 2 ];then

cat ~/.reports/$search_name/nmap_scan/tls-version-nmap.txt | grep -i --color=always -e 'TLSv' -e 'open' 

elif [ $search_choice -eq 3 ];then

cat ~/.reports/$search_name/nmap_scan/os-detection-nmap.txt | grep -i --color=always -e 'OSScan' -e 'OS CPE' -e 'Aggressive OS guesses'

elif [ $search_choice -eq 4 ];then

cat ~/.reports/$search_name/nmap_scan/agressive-nmap.txt | grep -i --color=always -e 'open' -e 'http-server-header' -e 'http-title' -e 'ssl-cert' -e 'valid'

elif [ $search_choice -eq 5 ];then

cat ~/.reports/$search_name/nmap_scan/agressive-nmap.txt | grep -i --color=always -e 'open' -e 'http-server-header' -e 'http-title' -e 'ssl-cert' -e 'valid'

else 

echo -e '\e[31mENTER CORRECT CHOICE\e[1;m'

fi

fi
