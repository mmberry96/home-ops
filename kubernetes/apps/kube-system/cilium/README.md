# Cilium

## OPNSense BGP

### General

BGP AS Number - 64513
Router ID - 10.0.0.1
Network Import-Check - Enabled
Route Redistribution - Connected Routes

### Neighbors

-   Name - anole01
    Peer-IP - 10.30.0.41
    Soft reconfiguration inbound - Enabled
    Peer Group - k8s
-   Name - anole02
    Peer-IP - 10.30.0.42
    Soft reconfiguration inbound - Enabled
    Peer Group - k8s
-   Name - anole03
    Peer-IP - 10.30.0.43
    Soft reconfiguration inbound - Enabled
    Peer Group - k8s

### Peer Groups

-   Name - k8s
    Remote AS - 64514
    Next-Hop-Self

#### Generated config

```sh
router bgp 64513
 no bgp default ipv4-unicast
 no bgp ebgp-requires-policy
 bgp network import-check
 bgp router-id 10.0.0.1
 neighbor k8s peer-group
 neighbor k8s remote-as 64514
 neighbor k8s activate
 neighbor k8s next-hop-self
 neighbor 10.30.0.41 peer-group k8s
 neighbor 10.30.0.42 peer-group k8s
 neighbor 10.30.0.43 peer-group k8s

 address-family ipv4 unicast
  redistribute connected
  neighbor 10.30.0.41 activate
  neighbor 10.30.0.41 soft-reconfiguration inbound
  neighbor 10.30.0.42 activate
  neighbor 10.30.0.42 soft-reconfiguration inbound
  neighbor 10.30.0.43 activate
  neighbor 10.30.0.43 soft-reconfiguration inbound
 exit-address-family
!
 address-family ipv6 unicast
  redistribute connected
 exit-address-family
!
```
