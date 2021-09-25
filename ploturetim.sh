#!/bin/bash

#exec > >(tee /root/update.log)
#exec 2>&1
#set -x

log() {
	# $1 => wget (0) oder curl (1) oder fetch (2)
    # $2 => Status (0 => Log-Message, 1 => Installation started, 2 => Installation finished, 3 => Panel started, 4 => Panel finished, 5 => Postinstall started, 6 => Installation bootet, ...)
    # $3 => individuelle Message
    
    # Wenn in der Message Umlaute oder Leerzeichen sind werden diese durch URL-Syntax ersetzt
    if ! test -z "$3"; then
        message=$(echo "$3" | sed 's/ /%20/g')
        message=$(echo "$message" | sed 's/Ä/%C3%84/g')
        message=$(echo "$message" | sed 's/Ö/%C3%96/g')
        message=$(echo "$message" | sed 's/Ü/%C3%9C/g')
        message=$(echo "$message" | sed 's/ß/%C3%9F/g')
        message=$(echo "$message" | sed 's/ä/%C3%A4/g')
        message=$(echo "$message" | sed 's/ö/%C3%B6/g')
        message=$(echo "$message" | sed 's/ü/%C3%BC/g')
	fi
    
    if [[ "$1" -eq "0" ]]; then
    	if [[ "$2" -eq "0" ]]; then
        	# Message
        	wget -qO- --no-check-certificate "https://asi-ext-l.contabo.net?action=addLog&hostname=vmi673317&token=74B01A425279AC1D8DF0928A3D7B21A8&message=$message"
    	elif [[ "$2" -eq "1" ]]; then
        	# Installation started
        	wget -qO- --no-check-certificate "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=is&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "2" ]]; then
        	# Installation finished
        	wget -qO- --no-check-certificate "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=if&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "3" ]]; then
        	# Panel started
        	wget -qO- --no-check-certificate "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=ps&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "4" ]]; then
        	# Panel finished
        	wget -qO- --no-check-certificate "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=pf&token=74B01A425279AC1D8DF0928A3D7B21A8"
        elif [[ "$2" -eq "5" ]]; then
        	# Postinstall started
            wget -qO- --no-check-certificate "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=pis&token=74B01A425279AC1D8DF0928A3D7B21A8"
		fi
  	elif [[ "$1" -eq "1" ]]; then
    	if [[ "$2" -eq "0" ]]; then
        	# Message
        	curl -s "https://asi-ext-l.contabo.net?action=addLog&hostname=vmi673317&token=74B01A425279AC1D8DF0928A3D7B21A8&message=$message"
    	elif [[ "$2" -eq "1" ]]; then
        	# Installation started
        	curl -s "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=is&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "2" ]]; then
        	# Installation finished
        	curl -s "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=if&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "3" ]]; then
        	# Panel started
        	curl -s "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=ps&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "4" ]]; then
        	# Panel finished
        	curl -s "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=pf&token=74B01A425279AC1D8DF0928A3D7B21A8"
        elif [[ "$2" -eq "5" ]]; then
        	# Postinstall started
        	curl -s "https://asi-ext-l.contabo.net?action=setBootstatus&hostname=vmi673317&status=pis&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	fi
  	
    elif [[ "$1" -eq "2" ]]; then
    	if [[ "$2" -eq "0" ]]; then
        	# Message
        	fetch --no-verify-hostname --no-verify-peer -o /dev/null "https://asi-ext-l.contabo.net/?action=addLog&hostname=vmi673317&token=74B01A425279AC1D8DF0928A3D7B21A8&message=$message"
    	elif [[ "$2" -eq "1" ]]; then
        	# Installation started
        	fetch --no-verify-hostname --no-verify-peer -o /dev/null "https://asi-ext-l.contabo.net/?action=setBootstatus&hostname=vmi673317&status=is&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "2" ]]; then
        	# Installation finished
        	fetch --no-verify-hostname --no-verify-peer -o /dev/null "https://asi-ext-l.contabo.net/?action=setBootstatus&hostname=vmi673317&status=if&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "3" ]]; then
        	# Panel started
        	fetch --no-verify-hostname --no-verify-peer -o /dev/null "https://asi-ext-l.contabo.net/?action=setBootstatus&hostname=vmi673317&status=ps&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	elif [[ "$2" -eq "4" ]]; then
        	# Panel finished
        	fetch --no-verify-hostname --no-verify-peer -o /dev/null "https://asi-ext-l.contabo.net/?action=setBootstatus&hostname=vmi673317&status=pf&token=74B01A425279AC1D8DF0928A3D7B21A8"
        elif [[ "$2" -eq "5" ]]; then
        	# Postinstall started
        	fetch --no-verify-hostname --no-verify-peer -o /dev/null "https://asi-ext-l.contabo.net/?action=setBootstatus&hostname=vmi673317&status=pis&token=74B01A425279AC1D8DF0928A3D7B21A8"
    	fi
    fi
}

sleep 5

# Installation of cURL

export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y curl


# Set the timezone

# Saint Louis

timedatectl set-timezone America/Chicago
log "1" "0" "Timezone America - Chicago was set."




sleep 1

log "1" "0" "Update installation started."

sleep 1


apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --force-yes


sleep 1

log "1" "0" "Update installation completed."

sleep 2



# Installation finished
log "1" "2"



rm /root/updater.sh
rm /etc/cron.d/updater

reboot
