# [DNS](http://en.wikipedia.org/wiki/Domain_Name_System)
![dns](./doc/20201024_175247.jpg?raw=true "dns")
internal DNS server infrastructure on APT Linux.
## Infrastructure
### name servers
| host | role | private FQDN | private IP address |
| --- | --- | --- | --- |
| ns1 | Primary DNS Server | ns1.net1.domain | 10.128.10.11 |
| ns2 | Secondary DNS Server | ns2.net1.domain | 10.128.20.12 |
<!-- @todo ns3  Tertiary DNS Server  ns3.net1.domain  10.128.30.13 -->
### clients
| host | role | private FQDN | private IP address |
| --- | --- | --- | --- |
| host1 | Generic host 1 | host1.net1.domain | 10.128.100.101 |
| host2 | Generic host 2 | host2.net1.domain | 10.128.200.102 |
## use
```
noud@hp-prodesk-600-g2-dm:~/workspace/infra-dns$ nslookup
> ns1
Server:         10.128.10.11
address:        10.128.10.11#53

Name:   ns1.net1.domain
address: 10.128.10.11
> ns2
Server:         10.128.10.11
address:        10.128.10.11#53

Name:   ns2.net1.domain
address: 10.128.20.12
> host1
Server:         10.128.10.11
address:        10.128.10.11#53

Name:   host1.net1.domain
address: 10.128.100.101
> exit
```
## install
- add admin user
- set private IP address with netmask ```255.255.0.0```
- [Ansible](http://ansible.com)
    - install
    - configure host or network(s) of hosts by Ansible
```
sudo apt install -y ansible
ansible-galaxy collection install ansible.posix
# on 10.128.10.11
ansible-vault create vault # edit, if you like
# example content
# vault_server_user: super_user
# vault_sudo_pass: secret
# vault_remote_ssh_user: remote_ssh_user
# vault_remote_ssh_pass: remote_ssh_secret
# vault_psql_pass: postgres
# vault_docker_hub_username: hub_user
# vault_docker_hub_password: hub_secret
ansible-playbook -i domain all.yml --ask-vault-pass
# on 10.128.100.101
./bin/install-config-host1.sh
```
## inspired by
[How To Configure BIND as a private Network DNS Server on Ubuntu 18.04](http://digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-18-04)
## hardware
### router
| brand | [SKU](http://en.wikipedia.org/wiki/Stock_keeping_unit) | alt | spec | IP addresses |
| --- | --- | --- | --- | --- |
| [Linksys](http://linksys.com) | [EA6900](http://linksys.com/us/support-product?pid=01t80000003KdHUAA0) | AC 1900 | 1GB & WiFi | 192.168.1.0/32
| [NETGEAR](http://netgear.com) | [WINDR4500](http://netgear.com/support/product/WNDR4500.aspx) | N900 | 1GB & WiFi | 10.128.0.0/16
### interfaces
| brand | model |
| --- | --- |
| [EMINENT](http://eminent-online.com) | [EM1010 Rev 2](http://support.eminent-online.com/hc/en-us/articles/360009536679-EM1010-Download-Drivers-Software) |
|  | EM4090 Rev 1 |
|  | EM4090 Rev 2 |
### [PC](http://en.wikipedia.org/wiki/Personal_computer)
| brand | series | model | CPU | memory (GB) | private IP address |
| --- | --- | --- | --- | --- | --- |
| [HP](http://hp.com) | ProDesk | [600 G2 DM](http://support.hp.com/us-en/product/hp-prodesk-600-g2-desktop-mini-pc/8376393) | Core i7-6700T @ 2.80GHz * 8 | 32 | 10.128.10.11
| [Intel](http://intel.com) | NUC | [5](http://intel.com/content/dam/support/us/en/documents/mini-pcs/nuc-kits/NUC5i3RYK_NUC5i5RYK_UserGuide.pdf) | Pentium E6500 @ 2.93GHz * 2 | 4 | 10.128.20.12
| [Acer](http://acer.com) | Aspire | [Z5600](http://acer.com/ac/en/US/content/support-product/1243;-;AZ5600) | Celeron N3050 @ 1.60gHZ * 2 | 4 | 10.128.100.101
| [Dell](http://dell.com) | Wyse | [3040](http://dell.com/support/manuals/nl/nl/nlbsdt1/wyse-3040-thin-client/3040_ug/welcome-to-dell-wyse-3040-thin-client?guid=guid-423f8ce2-8950-497f-88d3-22c2e1e3fe4a&lang=en-us) | Cherry Trail x5 Z-8350 @ 1.44 GHz * 4 | 2 |  |
| [ASUS](http://asus.com) |  | [p5](http://asus.com/Motherboards/P5B_Deluxe) |  |  |
### [USB](http://en.wikipedia.org/wiki/USB)
| brand | item | name | [GTIN](http://en.wikipedia.org/wiki/Global_Trade_Item_Number) | [EAN](http://en.wikipedia.org/wiki/International_Article_Number)
| --- | --- | --- | --- | --- |
| [Linkpro](http://linkpro.com.tw) | [USB-2204L](http://www.linkpro.com.tw/search_result.asp?keyin=USB-2204L&Search=Go) | 4 port USB Hub |
| [Trust](http://trust.com) | [14251](http://trust.com/en/product/14251-4-port-mini-usb-2-0-design-hub-hu-3340m) | 4 Port Mini USB 2.0 |  | 8713439142518 |
| [hama](http://hama.com) | [00055348](https://www.hama.com/00055348/hama-35in1-usb-20-multi-card-reader-blue) | USB 2.0 Multi Card Reader | 4007249553485 |  |
### [peripheral](http://en.wikipedia.org/wiki/Peripheral)
| brand | model | what |
| --- | --- | --- |
| [Jabra](http://jabra.com) | [Talk 30](http://jabra.com/bluetooth-headsets/jabra-talk-30) | headset |
| KAZO | Girly | powerbank |
| [PEAQ](http://imtron.com) | [PPA20BT](http://peaq-online.com/uploads/tx_fdproducts/PEAQ_Datenblatt_PPA20BT-SL.pdf) | headset |
| bullet | Duck cylinder Bluetooth® speaker with rubber finish | speaker |
| [Logitech](http://logitechg.com) | K520 | keyboard |
|  | M310 | mouse |
### displays
| brand | model | version | release |
| --- | --- | --- | --- |
| [Philips CE](http://philips.nl) |  | Q581E-064.146 | 5/10/2007 11:03:58 |
### [smartphone](http://en.wikipedia.org/wiki/Smartphone)
| brand | model |
| --- | --- |
| [Samsung](http://samsung.com) | [Galaxy Z Flip](https://downloadcenter.samsung.com/content/UM/202002/20200214193732764/SM-F700F_DS_UM_EU_QQ_Eng_Rev.1.0_200214.pdf) |

…WIP…
