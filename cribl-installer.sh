### Installing git for distribute mode to deploy configurations
#sudo yum -y install git jq

### Installing Cribl && move the directory under /opt/
if [ ! -d /opt/cribl ]; then
        sudo curl -Lso - $(curl https://cdn.cribl.io/dl/latest-x64) | tar zxv && mv cribl /opt/
else
        echo "Cribl is already installed"
fi

### Making variable for Cribl directory
if [ -d /opt/cribl ]; then
	
        ## Cribl Edge Setting
        # Change to Cribl Edge mode (Single Instance)
        # cd /opt/cribl/bin

	# Update Cribl Edge Setting
	# ./cribl mode-edge -H 0.0.0.0 -p 9420

        # Register Path variable
	echo "export CRIBL_HOME=/opt/cribl" >> /etc/profile
	source /etc/profile

	# echo "path to Cribl : $CRIBL_HOME"

	# Starting Cribl and boot-start
	sudo $CRIBL_HOME/bin/cribl start

	# sudo $CRIBL_HOME/bin/cribl boot-start enable -m initd

else
        echo "Cribl is not installed, failed to run Cribl"

fi
