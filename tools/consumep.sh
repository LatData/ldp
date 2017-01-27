#!/bin/bash
$LDP_KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9094 --topic $1
