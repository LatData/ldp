#!/bin/bash
find $LDP_HOME -name \*.out -o -name \*.log |xargs tail -f
