# xrdp-on-ubuntu

> 1 click scrpt for install xrdp on ubuntu

## Notice

No firewall rule setup by this script, you should handle it for security.

- for local network

```sh
# get your local ip
hostname -I

# setup firewall rule (eg. 192.168.10.99)
sudo ufw allow from 192.168.10.0/24 to any port 3389

sudo ufw reload
```

- for public access

```sh
# Danger Zone
sudo ufw allow 3389

sudo ufw reload
```

## Use it

```sh
# Need root user access

sudo sh <(curl -L xrdp.ubtu.net)
```

## Reference

[xrdp完美实现Windows远程访问Ubuntu 20.04](https://www.sohu.com/a/446523786_495675)

## License

MIT