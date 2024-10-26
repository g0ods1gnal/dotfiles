#!/bin/bash
VM_IP="192.168.1.106"
VM_UP=$(ping -c 1 $VM_IP &>/dev/null && echo "up" || echo "down")

if [[ $VM_UP == "up" ]]; then
    ~/dotfiles/scripts/toggle_vm_route.sh on
    echo "Routing through VM enabled."
else
    ~/dotfiles/scripts/toggle_vm_route.sh off
    echo "Routing through VM disabled."
fi

