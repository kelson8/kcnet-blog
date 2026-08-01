---
title: 'Homelab Journey'
date: '2026-08-01T13:03:22-04:00'
draft: false
toc: false
images:
tags:
  - linux
  - servers
  - homelab
---

# Info about my homelab

I have been working with Proxmox for a few years now, I manage VMs internally for testing things like the website, new website designs,
running my reverse proxies, and other stuff like that.

There is two Proxmox nodes in my setup, one running on an HP Mini PC, and the other runs on a custom built rack mount server.

I have messed with Linux administration quite a bit, and have been running Linux for the past few days which is running Pop OS that has KDE installed onto it.

Most of my VMs use Debian 13 with Docker installed, and some do use Ubuntu Server 24.04.
Anything new I deploy, I normally use Debian 13 since it works well for my needs.

## Specs for my Desktop
* CPU: Ryzen 2700x
* RAM: 48GB DDR4
* GPU: Amd RX 6700
* Case: [CORSAIR - 4000D](https://www.corsair.com/us/en/p/pc-cases/cc-9011200-ww/4000d-airflow-tempered-glass-mid-tower-atx-case-black-cc-9011200-ww)
* Main Storage: 2TB NVME for booting (Has Windows installed)
* Secondary SSD: 500GB Sata SSD, used for Minecraft saves, some Git repos along with some other game stuff.
* Secondary NVME Boot SSD: 500GB NVME SSD, used for Pop OS Linux install.
* Games HDD: 2TB HDD, this isn't really used much and has some of my game installs on it.
* Backup Storage: 4TB HDD for backing up to.
* Network Card: 1 port Mellanox ConnectX-3 SFP+ card for 10GB connection to Server. 


## Specs for my rack mount server
* CPU: Ryzen 3700x
* RAM: 64GB DDR4-3000
* GPU: GTX 1060 - This mostly has a GPU for testing and messing around with VFIO passthrough for gaming VMs, and also if needed I can use this for video output.
* Case: [RackChoice 4U Rackmount Server Chassis](https://www.amazon.com/dp/B0BJ1956L2)
* Main Storage: 1TB Sata SSD - For boot and VMs
* Main VM Storage: 2TB NVME - For VMs
* ZFS Backup: 2 10TB HDDs in a ZFS raid mirror for backups
* Media: 1 10TB HDD for media such as my pictures, videos, and music.
* Network Card: 2 port Solarflare S7120 SFP+ card for 10GB connection to Desktop.

## Specs for my HP Mini PCs

HP Mini PC #1, runs Proxmox, specs:
* CPU: i5-6500T
* RAM: 32GB DDR4
* Main Storage: 120GB NVME for Proxmox boot and some VMs.
* VMs Storage: 1TB NVME for VM storage.
* Nextcloud Storage: 1TB
* Backup Drive: 10TB (Older backup drive that's still in use.) 

HP Mini PC #2, runs Home Assistant and other testing, specs:
* CPU: i5-7500T
* RAM: 16GB DDR4
* Main Storage: 240GB NVME SSD for booting

## Gear running in server rack
* Dell R720 - This isn't in use that much and really only for backups.
* Custom rack mount server - Runs main backup system for desktop, main VMs and most of the homelab.
* Rasperry Pi 3 running PiHole
* HP Mini PC #1 - Runs Proxmox2 which runs both traefik and nginx proxy manager in separate VMs, also has Nextcloud with 1TB HDD.
* HP Mini PC #2 [HP EliteDesk 800 G3 Micro] - Runs Home Assistant and other services for testing.
* [Synology DS220+ 2 Bay Nas](https://www.synology.com/en-us/support/download/DS220+) with 2 8TB HDDs - This runs a lot of my VM backups and phone backups.
* Mikrotik CSS326-24G-2S+RM Switch for VLAN management, LACP and 10GB support.
* TP-Link TL-SG108PE - POE switch that powers my Mikrotik router and TP-Link access point.
* Arris SB8200 - Coax cable modem for Optimum service.
* [Mikrotik Hex S 2025](https://mikrotik.com/product/hex_s_2025) - Main Mikrotik router for the homelab.
* TP-Link EAP610v2 - Main Wifi access point for the homelab.




# Services running in homelab
I currently have this list of services below running

* Authelia - Protects some of the internal services that don't have a password or aren't too secure.
* Cloudflare DDNS - This keeps some Cloudflare DNS records up to date.
* Cyberchef - For encryption, encoding, compression and more.
* Dashy - Homelab dashboard.
* DN42 with Wireguard for BGP testing.
* Dozzle - For looking into Docker logs.
* ESPHome - This is for when I have temperature sensors or other stuff hooked up, it used to run the light control with the remote but I took the setup down.
* Gitea - Self hosted Git instance.
* Home Assistant - Controls my bedroom and living room lights, and will be used for temperature sensors also.
* Nextcloud - Syncs files from Desktop, phone and other systems.
* Nginx Proxy Manager - Secondary reverse proxy running `*.internal.kelsoncraft.net`
* Obsidian Livesync and CouchDB - For my notes to sync between all my devices.
* Romm - Rom manager for PS2, PS3 and more ripped from my own games.
* Plex - Runs my media library.
* Privatebin - Self hosted pastebin.
* PiHole - 2 for backups.
* Speed Test Tracker - Runs speed tests on my home internet connection every 12 hours.
* Tautulli - For monitoring the Plex server and viewing analytics.
* Traefik - Main reverse proxy running `*.local.kelsoncraft.net`
* Truenas - Runs on Dell R720 for my backup NAS.
* Uptime Kuma - For monitoring some local services.
* WikiJS - For my locally hosted Wiki.

# Networking for Homelab

## DNS
I have two PiHole servers running for my local DNS, one is running on a Raspberry Pi 3, and the other one is in a Proxmox LXC.
With this setup, I have both PiHole devices setup on the router for DHCP clients, and both get set on static clients also.

I have the PiHole blocked from all the VLANs besides VLAN 25, since I want the VMs to use the PiHole for now, the other VLANs use Cloudflare instead of my internal DNS.

## VLANs

| VLAN ID | Name | Description |
| ------- | ----- | ----- |
| 20 | Guest | For the guest wifi. |
| 25 | VMs | For isolated VM connections that shouldn't have LAN access. |
| 99 | Management | I haven't started to use this yet, I'll move my management stuff onto here later. |
| 150 | BGP | This is for DN42 and BGP testing isolated from the LAN. |

## IPv6
Since I do not have native IPv6 with Optimum, I am using a [Hurricane Electric](https://tunnelbroker.net/) IPv6 tunnel on my Mikrotik router, and I have a /48 subnet with [Hurricane Electric](https://tunnelbroker.net/).

I have one /64 allocated to VLAN 20, and another /64 allocated to VLAN 25, since some sites detect it as VPN traffic and block it, I don't put it one my main LAN.

The main LAN uses ULA IPv6 addresses which can easily be generated online.
* https://www.unique-local-ipv6.com/
* https://tools.iplocation.net/ipv6-ula-generator

I may switch over to using [Route64](https://route64.org/en) on some devices, which can work directly with Wireguard and they give a /56 for IPv6.

# New Experiments
I have been messing around with BGP using DN42.
* https://dn42.dev/howto/Getting-Started

**ASN Links**
* https://explorer.dn42.dev/?#/aut-num/AS4242422365
* https://explorer.dn42.dev/?#/person/WHYPEEPS-DN42
* https://explorer.dn42.dev/?#/mntner/WHYPEEPS-MNT
* https://map.iedon.net/#4242422365

This currently runs on a Proxmox VM that is connected to VLAN150, which isolates it from seeing the LAN at all.

Here is the Git repo that has most of the configs for kcn.dn42
* https://github.com/kelson8/kcn.dn42

### BGP ASN Info

|  | |
| ---- | ----|
| ASN | 4242422365 |
| ASN Name | AS-KCN-DN42 |
| Domain | kcn.dn42 |
| admin-c | WHYPEEPS-DN42 |
| tech-c | WHYPEEPS-DN42 |
| mnt-by | WHYPEEPS-MNT |
| nserver | ns1.kcn.dn42 172.23.117.32 - Not in use yet |
| nserver | ns1.kcn.dn42 fdb1:ef8b:1766:25::1 - Not in use yet  |
| nserver | ns2.kcn.dn42 172.23.117.33  |
| nserver | ns2.kcn.dn42 fdb1:ef8b:1766:25::2  |
| Source | DN42 |

### Unbound/Bind9

I have been messing around with getting bind9 working for DNS on my homelab.

I may fully switch from PiHole DNS to using Unbound to manage my `.lan` DNS domains much easier and shift IPs easier then changing every entry in the UI.

Here is my Bind9 setup for DN42
* https://github.com/kelson8/kcn.dn42/tree/master/bind

