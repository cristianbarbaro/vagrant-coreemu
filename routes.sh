#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "options: --add or --del"
    exit 1;
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in 
        -a | --add) cmd="add"; shift ;;
        -d | --del) cmd="del"; shift ;;
        *) echo "options: --add or --del"; exit 1 ;;
    esac
    shift
done

echo "obtengo la IP asignada a la máquina virtual: "

VM_IP=$(vagrant ssh -c "ip address show enp0s8 | grep 'inet ' | sed -e 's/^.*inet //' -e 's/\/.*$//'")

VM_IP=$(echo -n $VM_IP | tr -d '\r')

echo "Dirección IP: ${VM_IP}"

echo "Aplicando comando $cmd en rutas hacia la VM:"

echo "sudo ip route $cmd 163.10.0.0/16 via $VM_IP"
sudo ip route $cmd 163.10.0.0/16 via $VM_IP

echo "sudo ip route $cmd 207.248.74.0/23 via $VM_IP"
sudo ip route $cmd 207.248.74.0/23 via $VM_IP

echo "sudo ip route $cmd 157.92.0.0/16 via $VM_IP"
sudo ip route $cmd 157.92.0.0/16 via $VM_IP

echo "sudo ip route $cmd 170.210.0.0/16 via $VM_IP"
sudo ip route $cmd 170.210.0.0/16 via $VM_IP

echo "sudo ip route $cmd 10.0.8.0/24 via $VM_IP"
sudo ip route $cmd 10.0.8.0/24 via $VM_IP

echo "Rutas modificadas."

exit 0