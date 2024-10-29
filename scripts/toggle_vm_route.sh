#!/bin/bash

VM_IP="192.168.1.160"  # IP of the Ubuntu VM

ROUTE_BACKUP="/tmp/default_routes_backup"

enable_vm_route() {
    echo "Enabling routing through the VM..."

    ip route show default > "$ROUTE_BACKUP"
    sudo ip route del default via 192.168.1.1 dev wlan0 2>/dev/null
    while ip route del default 2>/dev/null; do :; done

    sudo ip route add default via $VM_IP
    echo "Traffic is now routed exclusively through the VM."
}

disable_vm_route() {
    echo "Restoring original routes..."

    while ip route del default 2>/dev/null; do :; done

    if [ -f "$ROUTE_BACKUP" ]; then
        while IFS= read -r line; do
            sudo ip route add $line
        done < "$ROUTE_BACKUP"
        echo "Original routes restored."
    else
        echo "No backup found. Unable to restore original routes."
    fi
}

case "$1" in
    on)
        enable_vm_route
        ;;
    off)
        disable_vm_route
        ;;
    *)
        echo "Usage: $0 {on|off}"
        ;;
esac

