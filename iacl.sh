#!/bin/bash 


echo "Excluindo usuarios"
userdel -r -f carlos
userdel -r -f maria
userdel -r -f joao
userdel -r -f debora
userdel -r -f sebastiana
userdel -r -f roberto
userdel -r -f josefina
userdel -r -f amanda
userdel -r -f rogerio

echo "Excluindo grupos"
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Excluindo diretórios"
rm -rf /publico
rm -rf /adm
rm -rf /ven
rm -rf /sec


echo "Criando diretorios"
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec


echo "Criando grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC


echo "Criando usuários"
useradd carlos -c "Usuario Carlos" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_ADM 
passwd carlos -e

useradd maria -c "Usuario Maria" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_ADM 
passwd maria -e 

useradd joao -c "Usuario Joao" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_ADM 
passwd joao -e 


useradd debora -c "Usuario Debora" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
passwd debora -e 

useradd sebastiana -c "Usuario Sebastiana" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
passwd sebastiana -e 

useradd roberto -c "Usuario Roberto" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
passwd roberto -e

useradd josefina -c "Usuario Josefina" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
passwd josefina -e 

useradd amanda -c "Usuario Amanda" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
passwd amanda -e 

useradd rogerio -c "Usuario Rogerio" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
passwd rogerio -e 

echo "Definindo permissoes"
chown -R root:root /publico
chown -R root:GRP_ADM /adm
chown -R root:GRP_VEN /ven
chown -R root:GRP_SEC /sec

chmod 777 /publico/
chmod 770 /adm/
chmod 770 /ven/
chmod 770 /sec/

echo "Finalizado"
