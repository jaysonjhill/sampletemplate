sudo su
yum update -y
yum install git -y
sudo touch /etc/yum.repos.d/docker.repo
printf "[dockerrepo] \nname=Docker Repository \nbaseurl=https://yum.dockerproject.org/repo/main/centos/7/ \nenabled=1 \ngpgcheck=1 \ngpgkey=https://yum.dockerproject.org/gpg" > /etc/yum.repos.d/docker.repo
yum install docker-engine -y 
service docker start
chkconfig docker on
curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose && ln -sv /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir /adop && cd /adop
git clone https://github.com/AccenturePDC/adop-docker-compose.git -b pdc-ext