#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <node1> <node2>"
    exit 1
fi

node1=$1
node2=$2

# Create network namespaces
sudo ip netns add $node1
sudo ip netns add $node2

# Create a virtual Ethernet pair
sudo ip link add eth1 type veth peer name eth2

# Move each end of the pair to its respective namespace
sudo ip link set eth1 netns $node1
sudo ip link set eth2 netns $node2

# Assign IP addresses to the interfaces
sudo ip netns exec $node1 ip addr add 192.168.1.1/24 dev eth1
sudo ip netns exec $node2 ip addr add 192.168.1.2/24 dev eth2

# Bring up the interfaces
sudo ip netns exec $node1 ip link set eth1 up
sudo ip netns exec $node2 ip link set eth2 up

sudo ip netns exec $node1 ping 192.168.1.2
