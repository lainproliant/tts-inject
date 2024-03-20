#!/bin/bash
#
# util.sh
#
# Author: Lain Musgrove (lain.proliant@gmail.com)
# Date: Wednesday March 20, 2024
#

function find-usercontent-in-json() {
    grep steamusercontent "$1" | awk '{print $2}' | sed 's/"\(.*\)".*/\1/' | sort | uniq
}

function usercontent-id-from-url() {
    echo "$1" | cut -d/ -f6
}

function usercontent-ext() {
    file --mime-type -b "$1" | cut -d/ -f2
}
