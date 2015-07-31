## Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

## Start vm

```sh
$ vagrant up
```

## SSH Tweaks

Needed for edeliver to run ssh commands

```sh
$ cat ~/.ssh/config
Host edeliver-vagrant
  Hostname 127.0.0.1
  Port 2200 # get port with vagrant ssh-config
  IdentityFile <path_to_repo>/edeliver-vagrant/.vagrant/machines/default/virtualbox/private_key
```
