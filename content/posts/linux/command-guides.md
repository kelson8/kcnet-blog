---
title: "Command Guides"
date: 2025-10-05T03:23:59-04:00
draft: false
toc: false
images:
tags:
  - linux
---

# Grep
To find a specific string in a file using grep:

https://stackoverflow.com/questions/16956810/find-all-files-containing-a-specific-text-string-on-linux

1. Go to the same directory as the files.
2. Run this command Change result to : grep -rnw ./ -e 'result'

# Misc commands
To display list of file sizes in order:
`du -h ./* | sort -h`

# Tar
To tar a file

Replace file with the file name, replace folder with the folder or file to add to the tar

Without compresion:
```
tar -cvf file.tar folder
```

With Tar GZ compression:
```
tar -czvf file.tar.gz folder
```

Extract an uncompressed tar file:
``` 
tar -xvf file.tar
```

Extract a Tar GZ file:
```
tar -xzvf file.tar.gz
```

# Git
To undo git commits that aren't yet pushed: 

```
git reset --soft HEAD~1 (Change 1 to the amount of commits to undo)
```

# NFS
Update NFS after adding a share:

https://www.netapp.com/learn/azure-anf-blg-linux-nfs-server-how-to-set-up-server-and-client/

```
First, export all shares: sudo exportfs -a
Then, restart nfs: sudo systemctl restart nfs-kernel-server
This one is optional, run this command to verify the shares: showmount -e
```

# Programs
To install docker:

```bash
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

 sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 
 # Add user to docker
 sudo groupadd docker
 sudo usermod -aG docker $USER
```

---
Install yt-dlp:

Make sure python and venv is installed, these are required
```
sudo apt install python3-venv
```

Create a venv somewhere, for example I'll use the Documents/ytdl folder
```
mkdir -p ~/Documents/ytdl
python3 -m venv ~/Documents/ytdl/venv
```

Then source the venv:
```
source ~/Documents/ytdl/venv/bin/activate
```

Lastly, install yt-dlp:
```
pip install yt-dlp
```

