yum update -y --exclude=WALinuxAgent
yum install git -y
mkfs -t ext3 /dev/xvdc
mkdir -p /adop
mount /dev/xvdc /adop
printf "[dockerrepo] \nname=Docker Repository \nbaseurl=https://yum.dockerproject.org/repo/main/centos/7/ \nenabled=1 \ngpgcheck=1 \ngpgkey=https://yum.dockerproject.org/gpg" > /etc/yum.repos.d/docker.repo
yum install -y docker-engine
printf "other_args=\'-g /adop/docker\'" >> /etc/sysconfig/docker
rm -rf /var/lib/docker
service docker start
chkconfig docker on
curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose,
chmod +x /usr/local/bin/docker-compose && ln -sv /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir /adop
cd /adop
git clone https://github.com/migueltanada/adop-docker-compose-java.git
export PUBLIC_IP=$(curl ifconfig.co)
export IP=$(hostname --ip-address)
export TARGET_HOST=${IP}
export LOGSTASH_HOST=${IP}
export CUSTOM_NETWORK_NAME=docker-network
chmod -R 700 /adop/adop-docker-compose-java
cd /adop/adop-docker-compose-java
docker network create ${CUSTOM_NETWORK_NAME}
source platform.secrets.sh
source env.config.sh
docker-compose -f docker-compose.yml -f etc/volumes/local/default.yml up -d