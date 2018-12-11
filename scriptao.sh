#!/bin/bash
echo "                      -EXECUTE COMO ROOT-"
echo ""
echo "MODO DE USO"
echo "$0 lista-de-ips.txt"
rm ips.txt
rm historico.txt
filer=$1
echo "$1 <--------------------------"
while IFS= read line
do
        # display $line or do somthing with $line
        #echo "$line" >> historico.txt
        host $line | grep "has address" | cut -d " " -f 4 >> ips.txt
        echo $line >> historico.txt
        host $line | grep "has address" | cut -d " " -f 4 >> historico.txt
        echo "https://"$line >> enderecos.txt
done < $filer

#------------------------------------------------

# abre o limpo.txt e procura por duplicatas do arquivo ip.txt(limpo.txt ficam todos os ips unicos)
python sanitize-ip.py

file="/home/limpo.txt";while IFS= read line ;do echo 'http://'"$line";done < "$file" > open_in_chrome.txt

echo "LIMPO.TXT CONTEM TODOS OS IPS"
#------------------------------------------------
#usa o masscan para fazer a varredura em todos os ips
echo "MASSCAN EM USO"
rm result_masscan.txt
sh shmasscan.sh >> result_masscan.txt
#------------------------------------------------

# transforma todo ip de um arquivo em http://ip

