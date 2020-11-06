#!/bin/bash
set -e          # exit on error
set -u          # fail if variable is undefined
set -o pipefail # fail if command in pipe chain fails

function relative-path-to-script-dir {
    dirname "${BASH_SOURCE[0]}"
}

function is-regular-file {
    local required="${1:?}"
    test -f "${required}"
}

function is-directory {
    local required="${1:?}"
    test -d "${required}"
}

function is-file {
    local required="${1:?}"
    test -e "${required}"
}

function is-path {
    local required="${1:?}"
    if [[ "${required}" =~ "/" ]]; then true; else false; fi
}

function to-lower-case {
    local required="${1:?}"
    echo $required | tr '[:upper:]' '[:lower:]'
}

# Monitor http traffic including headers and request bodies
function monitor-http-traffic {
    local IFACE="${1:?}"
    local PORT="${2:?}"
    tcpdump -A -i ${IFACE} -s 0 "tcp port ${PORT} and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)"
}
