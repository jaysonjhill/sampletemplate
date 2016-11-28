yum install git -y
mkdir /adop && cd /adop
git clone https://github.com/jaysonjhill/adop-docker-compose.git -b master
chmod -R 700 /adop/adop-docker-compose
cd /adop/adop-docker-compose
mkdir -p conf/provider/oracle
# Example file to store all the generated secrets for your ADOP stack

# Username for initial admin user
export INITIAL_ADMIN_USER="john.smith"

# Password for initial admin user
export INITIAL_ADMIN_PASSWORD_PLAIN="Password01"

# Password for the Jenkins user
export PASSWORD_JENKINS="1e6a8dd7fe461209"

# Password for the Gerrit user
export PASSWORD_GERRIT="127893c312264915"

# Root password for the Sonar and Gerrit MySQL instances
export PASSWORD_SQL="65c25aa649ac5214"
source ./conf/env.provider.sh
source ./credentials.generate.sh
source ./env.config.sh