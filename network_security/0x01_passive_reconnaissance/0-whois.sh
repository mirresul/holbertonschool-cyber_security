#!/bin/bash
whois $1 | awk -F': ' '/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Phone Ext\.|Fax|Fax Ext\.|Email):/{gsub(/Phone Ext\./,"Phone Ext:"); gsub(/Fax Ext\./,"Fax Ext:"); field=$1; val=$2; if(field ~ /Street/) val=val" "; printf "%s,%s\n", field, val}' > $1.csv
