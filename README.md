HI
Rundeck rundeck-2.9.4-1.38.GA.noarch

this setup is good for AWS ECS and Docker stand alone

Its tested on AWS ecs and as DB service RDS
pls config the file - "rundeck-config.properties"


grails.serverURL = "https://YOUR_FQDN:4443"
dataSource.url = jdbc:mysql://SQL_SERVER_IP/rundeck?autoReconnect=true
dataSource.username = sql_user
dataSource.password = sql_password

and config the
File - "framework.properties file"

framework.server.name = YOUR_FQDN
framework.server.hostname = YOUR_FQDN
framework.server.port = 4443
framework.server.url = https://YOUR_FQDN:4443
# Username/password used by CLI tools.
framework.server.username = user
framework.server.password = pass

*** NOTE ! ****

Dont forget to create public and private keys
and add it to the id_rsa and id_rsa.pub
in the setup its copy to the server and being use as access to the node
dont forget to add it to the end node as you will not able to run jobs

in my setup i am using General Nodes and not per project

File - "project.properties"
#project.resources.file = /var/rundeck/projects/etc/resources.xml
