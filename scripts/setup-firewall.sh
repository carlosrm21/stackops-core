#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo " Por favor, ejecuta este script como root (sudo)."
  exit 1
fi
echo " Iniciando la optimización y seguridad del servidor..."
apt update && apt upgrade -y
apt install -y ufw fail2ban curl git
echo " Optimizando límites del sistema de red..."
cat <<EOT >> /etc/sysctl.conf
fs.file-max = 2097152
net.core.somaxconn = 65535
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 15
EOT
sysctl -p
echo " Configurando las reglas del Cortafuegos (UFW)..."
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 443/udp
ufw --force enable
echo " Configurando Fail2Ban para protección SSH..."
cat <<EOT > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
findtime = 10m
bantime = 1h
EOT
systemctl restart fail2ban
echo " Servidor optimizado y protegido con éxito."
ufw status verbose
