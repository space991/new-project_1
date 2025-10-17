#!/bin/bash

# Обновляем и устанавливаем пакеты на локальной машине
sudo apt update
sudo apt-get install  openvpn
sudo apt-get install net-tools
sudo apt-get install mc
sudo apt-get install iptables


#создание каталога easy-rsa
if [[! -d easy-rsa ]]; then
  mkdir ~/easy-rsa

else
  echo "easy-rsa уже существует"
fi

#создание каталога символической ссылки easy-rsa

if [ ! -L ~/easy-rsa ]; then
    # Если ссылки нет, создаем ее
    ln -s /usr/share/easy-rsa/* ~/easy-rsa/
    echo "Символическая ссылка ~/easy-rsa/ создана."
else
    echo "Символическая ссылка ~/easy-rsa/ уже существует."
fi

#Получение UID текущего пользователя
USER_UID=$(id -u)

#присвоение прав пользователю

sudo chown $USER_UID ~/easy-rsa

chmod 700 ~/easy-rsa

