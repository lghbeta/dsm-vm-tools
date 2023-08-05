# dsm-vm-tools

> forked from [yale-wp/docker-xpenology-open-vm-tools](https://github.com/yale-wp/docker-xpenology-open-vm-tools), Based on Alpine reduced image size and modify the shutdown behavior.

This Docker container allows you to run open-vm-tools on a Xpenology DSM running on VMware ESXi.

* Supports Shutdown/Restart
* Returns DSM networking information to the VMware ESXi host

## Dependencies

* SSH must be enabled on your DSM.
  * The shutdown and restart commands are sent over ssh.
  * This container will generate a unique ssh key pair when it is first launched.
* Docker installed via DSM Package Manager.

## Usage

SSH into your DSM and run this command.

```shell
sudo mkdir /root/.ssh
sudo docker run -d --restart=always --net=host -v /root/.ssh/:/root/.ssh/ --name dsm-vm-tools aniven/dsm-vm-tools
```

or via `docker-compose`

```yaml
version: "3"
services:
  vmtools:
    image: aniven/dsm-vm-tools
    container_name: vm-tools
    restart: always
    volumes:
      - /root/.ssh:/root/.ssh
    network_mode: host
```

