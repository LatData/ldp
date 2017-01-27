#!/bin/bash

dir=$(pwd);

read -r -p "Download Apache Zookeeper, Flume & Kafka? [y/N] " download
case $download in
    [yY][eE][sS]|[yY]) 
        
	read -r -p "Install in $dir folder? [y/N] " folder
	case $folder in
	    [yY][eE][sS]|[yY]) 
        	echo "downloading and installing in $dir ..."

		wget http://www-us.apache.org/dist/flume/1.7.0/apache-flume-1.7.0-bin.tar.gz
		wget http://www-us.apache.org/dist/zookeeper/current/zookeeper-3.4.9.tar.gz
		wget http://www-us.apache.org/dist/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz
		
		rm -rf zookeeper_bin && mkdir zookeeper_bin
		rm -rdf kafka_bin && mkdir kafka_bin
		rm -rf flume_bin && mkdir flume_bin

		tar -zxvf zookeeper-3.4.9.tar.gz -C  zookeeper_bin --strip 1
		tar -zxvf apache-flume-1.7.0-bin.tar.gz -C flume_bin --strip 1
		tar -zxvf kafka_2.11-0.10.1.1.tgz -C kafka_bin --strip 1
		
		rm -rf zookeeper-3.4.9.tar.gz
		rm -rf apache-flume-1.7.0-bin.tar.gz
		rm -rf kafka_2.11-0.10.1.1.tgz 
	
		ldhome=$dir
		zookeeperhome="$dir/zookeeper_bin"
		kafkahome="$dir/kafka_bin"
		flumehome="$dir/flume_bin"

		cp $dir/etc/profile.d/ldp-env.sh.base /etc/profile.d/ldp.sh
		sed -i 's@ldplatform_home@'"$ldhome"'@' /etc/profile.d/ldp.sh
		sed -i 's@zookeeper_home@'"$zookeeperhome"'@' /etc/profile.d/ldp.sh
		sed -i 's@kafka_home@'"$kafkahome"'@' /etc/profile.d/ldp.sh
		sed -i 's@flume_home@'"$flumehome"'@' /etc/profile.d/ldp.sh

		#CREATE USER
		useradd -r -s /bin/false ldp
	
		#COPY INIT SCRIPT
		cp $dir/etc/init.d/ldp /etc/init.d
		chmod +x /etc/init.d/ldp

		#UPDATE SERVICES
		systemctl daemon-reload
		update-rc.d ldp defaults


	
		
	    ;;
	    *)
	        echo "where to install?..."
	    ;;
	esac


    ;;
    *)
        echo "where is kafka installed?..."
    ;;
esac


