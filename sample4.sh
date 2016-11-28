mkdir /adop && cd /adop
git clone https://github.com/jaysonjhill/adop-docker-compose.git -b master
chmod -R 700 /adop/adop-docker-compose
cd /adop/adop-docker-compose
mkdir -p conf/provider/oracle
source ./conf/env.provider.sh
source ./credentials.generate.sh
source ./env.config.sh