Installing and configuring a DHCP server on Debian 12 (Bookworm)


#Step 1: Installing the DHCP server package

`
apt update
apt install isc-dhcp-server
`


#Step 2: Configuring the DHCP server

The DHCP server's main configuration file is located at /etc/dhcp/dhcpd.conf.

`
subnet 192.168.2.0 netmask 255.255.255.0 {
  range 192.168.2.10 192.168.2.99;
  option routers 192.168.1.1;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  default-lease-time 600;
  max-lease-time 7200;
}
`

Ensure that the subnet and range directives match your network requirements. The option routers directive should be set to your gateway IP, and the option domain-name-servers should be set to the DNS servers you wish to use.


#Step 3: Defining the network interface

Specify the network interface that the DHCP server should use to listen for requests in the file /etc/default/isc-dhcp-server.

`
INTERFACESv4="eth0"
`

Replace eth0 with the actual name of your network interface.


#Step 4: Configuring the network interface

The network interface configuration is in the file /etc/network/interfaces.

`
allow-hotplug eth0
iface eth0 inet static 
    address 192.168.2.1/24 
    gateway 192.168.1.1 
    dns-nameservers 8.8.8.8 8.8.4.4
`


#Step 5: Starting, enabling and checking the DHCP service

`
systemctl start isc-dhcp-server
systemctl enable isc-dhcp-server
systemctl status isc-dhcp-server
`

