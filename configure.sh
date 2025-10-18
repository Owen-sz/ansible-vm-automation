#!/usr/bin/env bash

ansible-galaxy role install robertdebock.fail2ban

passwd --lock root

echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

systemctl restart sshd

echo "[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
findtime = 300
bantime = 3600
ignoreip = 127.0.0.1" >>

ufw allow OpenSSH
