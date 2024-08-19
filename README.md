
Ceph Dashboard is now available at:

             URL: https://server1:8443/
            User: admin
        Password: rxqm4j6u39

```ssh
# @all
$ timedatectl status
# -> System clock synchronized: yes
# -> NTP service: active
# -> RTC in local TZ: no

# @all
$ sudo root passwd

# @master
$ ssh-keygen

# @master against all other machine
$ ssh-copy-id root@host

# @master
cephadm bootstrap --mon-ip master-ip
ceph -s

# @master against all other machine
$ ssh-copy-id -f -i /etc/ceph/ceph.pub root@host

# @master against all other machine
$ ceph orch host add <hostname> <other-host-ip> --labels _admin # Omit lables if needed

# @master
$ ceph orch device ls
$ ceph orch apply osd --all-available-devices

$ watch ceph osd tree


# Creating S3-compatible object gateway
# @master
$ ceph orch apply rgw foo


# Do below only if you want to create a volume and mount a host
# @master
$ ceph fs volume create cephfs
$ mount -t ceph :/ /mnt/ceph/ -o name=admin
```
