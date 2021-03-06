#!/bin/bash

set -e
UBUNTU=false
DEBIAN=false
if [ "$(uname)" = "Linux" ]
then
	#LINUX=1
	if type apt-get
	then
		OS_ID=$(lsb_release -is)
		if [ "$OS_ID" = "Debian" ]; then
			DEBIAN=true
		else
			UBUNTU=true
		fi
	fi
fi

if [ "$(uname)" = "Linux" ]
then
	#LINUX=1
	if $UBUNTU || $DEBIAN
	then
		# DEBIAN or Ubuntu
		echo "Installing on DEBIAN or Ubuntu."
		set +e
		sudo apt-get update
		set -e
		sudo apt-get install -y git gcc g++ make automake curl wget oathtool
		arch=$(dpkg --print-architecture)
		wget https://github.com/mikefarah/yq/releases/download/v4.17.2/yq_linux_${arch}.tar.gz -O - | tar xz && sudo mv yq_linux_${arch} /usr/local/bin/yq
	else
		echo "os not support"
		exit 0
	fi
else
	echo "os not support"
    exit 0
fi

git submodule init
git submodule update


cd sshpass
./bootstrap
./configure
make

sudo mv sshpass /usr/local/bin/sshpass

cd ..
sudo cp sshotppass /usr/local/bin/sshotppass
sudo chmod +x /usr/local/bin/sshotppass
