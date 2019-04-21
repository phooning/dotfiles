#!/bin/sh

function not_cloudflare_dns {
    INTERFACE=$1
    if [ "$INTERFACE" = "An asterisk (*) denotes that a network service is disabled." ]; then
        echo 0
    else
        DNS=$(networksetup -getdnsservers "$INTERFACE" | tr -d "\n")
        if [ "$DNS" != "1.1.1.11.0.0.1" ]; then
            echo 1
        else
            echo 0
        fi
    fi
}
export -f not_cloudflare_dns

function set_cloudflare_dns {
    INTERFACE=$1
    sudo networksetup -setdnsservers "$INTERFACE" 1.1.1.1 1.0.0.1
}
export -f set_cloudflare_dns


function process {
    INTERFACE=$1
    IS_NOT_CLOUDFLARE_DNS=$(not_cloudflare_dns "$INTERFACE")
    if [ "$IS_NOT_CLOUDFLARE_DNS" = "1" ]; then
        set_cloudflare_dns "$INTERFACE"
    fi
}
export -f process

networksetup listallnetworkservices | xargs -I{} bash -c 'process "{}"'