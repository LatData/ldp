#!/bin/bash
echo "Downloading and uncompressing flume 1.7, zookeeper 3.4.9 & kafka 0.10.1.1..."

wget http://www-us.apache.org/dist/flume/1.7.0/apache-flume-1.7.0-bin.tar.gz
wget http://www-us.apache.org/dist/zookeeper/current/zookeeper-3.4.9.tar.gz
wget http://www-us.apache.org/dist/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz

tar -zxvf zookeeper-3.4.9.tar.gz
tar -zxvf apache-flume-1.7.0-bin.tar.gz
tar -zxvf kafka_2.11-0.10.1.1.tgz 

