#!/bin/sh

set -e

command_exists() {
  command -v "$@" > /dev/null
}

dir_exists() {
  test -d "$@"
}

file_exists() {
  test -f "$@"
}

install_soft() {
    apt update
    apt install ubuntu-desktop xrdp
}

add_user(){
    if id -nG "xrdp" | grep -qw "ssl-cert"; then
        echo "user xrdp already added to group ssl-cert"
    else
        adduser xrdp ssl-cert
        echo  "user xrdp added to group ssl-cert rightnow"
    fi
}

solve_blackscreen() {
    if grep -qw "DBUS_SESSION_BUS_ADDRESS" /etc/xrdp/startwm.sh; then
        echo "blackscreen already solved"
    else
        sed -i "5 i unset DBUS_SESSION_BUS_ADDRESS" /etc/xrdp/startwm.sh
        sed -i "6 i unset XDG_RUNTIME_DIR\n" /etc/xrdp/startwm.sh
        systemctl restart xrdp
        echo "blackscreen solved rightnow"
    fi
}

main() {
    if [ "$(id -u)" != 0 ]; then
        echo "This script need root user access"
        exit 1
    fi

    if !(command_exists xrdp); then
        read -p "xrdp not installed, any key to install and set xrdp" a
        install_soft
        add_user
        solve_blackscreen
    else
        read -p "xrdp installed, any key to set xrdp" a
        add_user
        solve_blackscreen
    fi
}

main $@