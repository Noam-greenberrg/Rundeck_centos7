# Dockerfile for rundeck

FROM centos:7
MAINTAINER  Noam Greenberg "noam.gr@matomy.com"

RUN \
yum install -y epel-release && \
yum update -y && \
yum install -y mysql-connector-java \
               mysql-connector-odbc \
               mysql-connector-python \
               mysql-utilities \
               openssh-clients \
               mysql-proxy \
               pwgen \
               java-1.8.0 \
               wget \
               curl \
               nfs-utils \
               python-pip \
               vim

RUN rpm -Uvh http://repo.rundeck.org/latest.rpm && \
    wget https://bintray.com/rundeck/rundeck-rpm/rpm -O bintray.repo && \
    mv bintray.repo /etc/yum.repos.d/ && \
    yum install -y rundeck-cli \
                   rundeck-2.9.4-1.38.GA.noarch \
                   rundeck-config-2.9.4-1.38.GA.noarch


EXPOSE 4443 4440



COPY docker-entrypoint.sh /

COPY  ./etc/rundeck/* /etc/rundeck/
RUN chmod u+x ./docker-entrypoint.sh


ENTRYPOINT ["/docker-entrypoint.sh"]
