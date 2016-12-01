yum update -y --exclude=WALinuxAgent
yum install git -y
touch /etc/yum.repos.d/docker.repo
printf "[dockerrepo] \nname=Docker Repository \nbaseurl=https://yum.dockerproject.org/repo/main/centos/7/ \nenabled=1 \ngpgcheck=1 \ngpgkey=https://yum.dockerproject.org/gpg" > /etc/yum.repos.d/docker.repo
yum install docker-engine -y 
service docker start
chkconfig docker on
curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose && ln -sv /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir /adop && cd /adop
git clone https://github.com/jaysonjhill/adop-docker-compose.git -b master
chmod -R 700 /adop/adop-docker-compose
cd /adop/adop-docker-compose
mkdir -p conf/provider/oracle
export PUBLIC_IP=$(curl ifconfig.co)
export IP=$(hostname --ip-address) 
export TARGET_HOST=${IP}
export LOGSTASH_HOST=${IP}
export CUSTOM_NETWORK_NAME=docker-network
docker network create ${CUSTOM_NETWORK_NAME}
docker-compose -f compose/elk.yml up -d
export INITIAL_ADMIN_USER="john.smith"
export INITIAL_ADMIN_PASSWORD_PLAIN="saadsadasd"
export PASSWORD_JENKINS="1e6a8dd7fe461209"
export PASSWORD_GERRIT="127893c312264915"
export PASSWORD_SQL="65c25aa649ac5214"
source ./conf/env.provider.sh
source ./credentials.generate.sh
source ./env.config.sh
docker-compose pull
docker-compose -f docker-compose.yml -f etc/volumes/local/default.yml up -d