#!/bin/sh

echo "Purguing Zookeeper & Kafka partition info..."

rm -rdf /tmp/zookeeperl/version-2/*
rm -rdf /tmp/zookeeperf/version-2/*
rm -rdf /tmp/zookeeperp/version-2/*


rm -rdf /tmp/kafkal-logs/*
rm -rdf /tmp/kafkaf-logs/*
rm -rdf /tmp/kafkap-logs/*

echo "Purged..."

