#!/bin/cribl-installer.sh

### Installing git for distribute mode to deploy configurations
sudo yum -y install git jq

### Installing Cribl && move the directory under /opt/
if [ ! -d /opt/cribl ]; then
	sudo curl -Lso - $(curl https://cdn.cribl.io/dl/latest-x64) | tar zxv && mv cribl /opt/
else 
	echo "Cribl is already installed"
fi

### Making variable for Cribl directory
if [ -d /opt/cribl ]; then
	export CRIBL_HOME=/opt/cribl
	
	# Starting Cribl and boot-start
	sudo $CRIBL_HOME/bin/cribl start
	# sudo $CRIBL_HOME/bin/cribl boot-start enable -m initd
else
	echo "Cribl is not installed, failed to run Cribl"

fi