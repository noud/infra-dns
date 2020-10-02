# DNS
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