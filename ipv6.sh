#!/bin/bash

# Konfigurasi IPv6
# Pastikan antarmuka jaringan mengaktifkan IPv6

# Periksa apakah IPv6 aktif pada antarmuka jaringan
ipv6_status=$(ip -6 addr show | grep inet6)

if [ -n "$ipv6_status" ]; then
    echo "IPv6 telah diaktifkan pada antarmuka jaringan."
else
    echo "IPv6 tidak diaktifkan pada antarmuka jaringan. Aktifkan terlebih dahulu."
    exit 1
fi

# Konfigurasi Router
# Pastikan router Anda mendukung IPv6 dan meneruskan lalu lintas IPv6 ke server

# Konfigurasi Firewall
# Pastikan firewall di server sudah dikonfigurasi untuk mengizinkan lalu lintas IPv6
# Misalnya, jika menggunakan iptables:
# iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
# iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
# iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
# iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# iptables -P INPUT DROP

# Konfigurasi IPv6 di Debian
# Anda dapat mengonfigurasi antarmuka jaringan di Debian menggunakan berkas konfigurasi /etc/network/interfaces
# atau dengan menggunakan NetworkManager jika Anda menggunakannya.

# Tambahkan DNS IPv6
# Pastikan server DNS yang Anda gunakan juga mendukung IPv6
echo "nameserver 2001:4860:4860::8888" > /etc/resolv.conf

# Uji Koneksi
# Uji koneksi ke server Debian menggunakan alamat IPv6
# Misalnya, ping6 atau ssh ke alamat IPv6 server Anda untuk memastikan bahwa server dapat diakses melalui IPv6 secara publik.

# Contoh pengujian ping6
ping6 -c 4 your_ipv6_address

# Contoh pengujian ssh
# ssh user@your_ipv6_address
