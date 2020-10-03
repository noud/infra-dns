# DNS
internal DNS server infrastructure on APT Linux.
## Infrastructure
### name servers
| Host | Role | Private FQDN | Private IP Address |
| --- | --- | --- | --- |
| ns1 | Primary DNS Server | ns1.net1.domain | 10.128.10.11 |
| ns2 | Secondary DNS Server | ns2.net1.domain | 10.128.20.12 |
<!-- @todo ns3  Tertiary DNS Server  ns3.net1.domain  10.128.30.13 -->
### clients
| Host | Role | Private FQDN | Private IP Address |
| --- | --- | --- | --- |
| host1 | Generic Host 1 | host1.net1.domain | 10.128.100.101 |
| host2 | Generic Host 2 | host2.net1.domain | 10.128.200.102 |
## use
```
noud@hp-prodesk-600-g2-dm:~/workspace/infra-dns$ nslookup
> ns1
Server:         10.128.10.11
Address:        10.128.10.11#53

Name:   ns1.net1.domain
Address: 10.128.10.11
> ns2
Server:         10.128.10.11
Address:        10.128.10.11#53

Name:   ns2.net1.domain
Address: 10.128.20.12
> host1
Server:         10.128.10.11
Address:        10.128.10.11#53

Name:   host1.net1.domain
Address: 10.128.100.101
> exit
```
## install
- add admin user
- set Private IP Address with netmask ```255.255.0.0```
- install and config by shell script
```
# on 10.128.10.11
./bin/install-config-ns1.sh
# on 10.128.20.12
./bin/install-config-ns2.sh
# on 10.128.100.101
./bin/install-config-host1.sh
```
## inspired by
[How To Configure BIND as a Private Network DNS Server on Ubuntu 18.04](http://digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-18-04)
## hardware
### router
| Brand | [SKU](http://en.wikipedia.org/wiki/Stock_keeping_unit) | spec | IP Addresses |
| --- | --- | --- | --- |
| [Linksys](http://linksys.com) | [EA6900 — AC 1900](http://linksys.com/us/support-product?pid=01t80000003KdHUAA0) | 1GB & WiFi | 10.128.0.0/16
| [NETGEAR](http://netgear.com) | [WINDR4500 — N900](http://netgear.com/support/product/WNDR4500.aspx) | 1GB & WiFi | 192.168.1.0/32
### pc
| Brand | Type | CPU | memory | Private IP Address |
| --- | --- | --- | --- | --- |
| [HP](http://hp.com) | [ProDesk 600 G2 DM](http://support.hp.com/us-en/product/hp-prodesk-600-g2-desktop-mini-pc/8376393) | Core i7-6700T @ 2.80GHz * 8 | 32GB | 10.128.10.11
| [Intel](http://intel.com) | [NUC 5](http://intel.com/content/dam/support/us/en/documents/mini-pcs/nuc-kits/NUC5i3RYK_NUC5i5RYK_UserGuide.pdf) | Pentium E6500 @ 2.93GHz * 2 | 4GB | 10.128.20.12
| [Dell](http://dell.com) | [Wyse 3040](http://dell.com/support/manuals/nl/nl/nlbsdt1/wyse-3040-thin-client/3040_ug/welcome-to-dell-wyse-3040-thin-client?guid=guid-423f8ce2-8950-497f-88d3-22c2e1e3fe4a&lang=en-us) | Cherry Trail x5 Z-8350 @ 1.44 GHz * 4 | 2GB|  |
| [Acer](http://acer.com) | [Aspire Z5600](http://acer.com/ac/en/US/content/support-product/1243;-;AZ5600) | Celeron N3050 @ 1.60gHZ * 2 | 4GB | 10.128.100.101