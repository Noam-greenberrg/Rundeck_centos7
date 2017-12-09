#!/bin/bash


cp /etc/rundeck/id_rsa  /var/lib/rundeck/.ssh/id_rsa
cp /etc/rundeck/id_rsa.pub /var/lib/rundeck/.ssh/id_rsa.pub
chown 600  /var/lib/rundeck/.ssh/id_rsa
chown 600  /var/lib/rundeck/.ssh/id_rsa.pub


#if [ ! -f /var/lib/rundeck/.ssh/id_rsa ]; then
#    echo "=>Generating rundeck ssh key"
#
#    mkdir -p /var/lib/rundeck/.ssh
#    ssh-keygen -t rsa -b 4096 -f /var/lib/rundeck/.ssh/id_rsa -N ''
#fi

if [ ! -f /etc/rundeck/ssl/truststore ]; then
    echo "=>Generating ssl cert"

    keytool -keystore /etc/rundeck/ssl/keystore \
        -alias rundeck -genkey -keyalg RSA -keypass adminadmin \
        -storepass adminadmin -dname "cn=$HOST_RUNDECK, o=OME, c=FR"
    cp /etc/rundeck/ssl/keystore /etc/rundeck/ssl/truststore
fi

echo "=>launching rundeck"

chown -R rundeck:rundeck /tmp/rundeck
chown -R rundeck:rundeck /etc/rundeck
chown -R rundeck:rundeck /var/rundeck
chown -R rundeck:rundeck /var/log/rundeck
chown -R rundeck:rundeck /var/lib/rundeck


cp /etc/rundeck/id_rsa  /var/lib/rundeck/.ssh/id_rsa
cp /etc/rundeck/id_rsa.pub /var/lib/rundeck/.ssh/id_rsa.pub
chmod 600  /var/lib/rundeck/.ssh/id_rsa
chmod 600  /var/lib/rundeck/.ssh/id_rsa.pubq
cat /var/lib/rundeck/.ssh/id_rsa.pub

echo " Start Docker "
service rundeckd start && tail -f /dev/null