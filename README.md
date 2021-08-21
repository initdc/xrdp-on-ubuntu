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

sudo su

sh <(curl -L xrdp.ubtu.net)
```

## Reference

[xrdp 完美实现 Windows 远程访问 Ubuntu 20.04](https://www.sohu.com/a/446523786_495675)

[How to fix “Authentication is required to create a color profile/managed device” on Ubuntu 20.04 / 20.10](https://devanswers.co/how-to-fix-authentication-is-required-to-create-a-color-profile-managed-device-on-ubuntu-20-04-20-10/)

## License

MIT
