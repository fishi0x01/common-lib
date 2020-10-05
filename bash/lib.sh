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

