#!/bin/bash
#
# extract.sh
#
# Author: Lain Musgrove (lain.proliant@gmail.com)
# Date: Wednesday March 20, 2024
#

set -e
source ./util.sh

CONTENT_DIR="./content"

function download-usercontent() {
    local content_id="$1"
    local content_url="$2"
    local extension

    echo "Downloading $content_url to $content_id..."
    if ! [ -f "$CONTENT_DIR/$content_id*" ]; then
        curl -o "$CONTENT_DIR/$content_id" "$content_url"
        extension=$(usercontent-ext "$CONTENT_DIR/$content_id")
        mv "$CONTENT_DIR/$content_id" "$CONTENT_DIR/$content_id.$extension"
    fi

}

function extract-usercontent() {
    mkdir -p "$CONTENT_DIR"
    for url in $(find-usercontent-in-json "$1"); do
        local content_id
        content_id=$(usercontent-id-from-url "$url")
        download-usercontent "$content_id" "$url"
    done
}

extract-usercontent "$1"
