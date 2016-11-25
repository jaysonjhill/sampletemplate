yum update -y
#sudo yum install git -y
#sudo touch /etc/yum.repos.d/docker.repo
#sudo printf "[dockerrepo] \nname=Docker Repository \nbaseurl=https://yum.dockerproject.org/repo/main/centos/7/ \nenabled=1 \ngpgcheck=1 \ngpgkey=https://yum.dockerproject.org/gpg" > /etc/yum.repos.d/docker.repo
#sudo yum install docker-engine -y 
#sudo service docker start
#sudo chkconfig docker on
#sudo curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose && ln -sv /usr/local/bin/docker-compose /usr/bin/docker-compose
#sudo mkdir /adop && cd /adop
#sudo git clone https://github.com/rhubel123/adop-docker-compose-hcm.git