FROM gitpod/workspace-full

# OS Packages
RUN bash -c "sudo apt-get update"
RUN bash -c "sudo pip install --upgrade pip"
RUN bash -c "sudo install-packages gettext tmux htop"

# Brew packages
RUN bash -c "brew install gh fio golang cowsay lolcat terraform"

# Java, Maven and Quarkus
ARG JAVA_VERSION=20-amzn
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk install java ${JAVA_VERSION} && sdk default java ${JAVA_VERSION} && sdk install maven &&  sdk install quarkus"

# Flyway Database Migration CLI
RUN bash -c "mkdir -p '/tmp/flyway' && wget -nv -O '/tmp/flyway/flyway-commandline-8.5.11-linux-x64.tar.gz' 'https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/8.5.11/flyway-commandline-8.5.11-linux-x64.tar.gz' && tar zxvf '/tmp/flyway/flyway-commandline-8.5.11-linux-x64.tar.gz' -C '/tmp/flyway/' && sudo mv '/tmp/flyway/flyway-8.5.11' '/usr/local/flyway' && sudo ln -s '/usr/local/flyway/flyway' '/usr/local/bin/flyway' && rm -rf '/tmp/flyway'"

# Jupyter Notebooks
RUN bash -c "pip install jupyter"

# AWS CLI
RUN bash -c "curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip' && unzip awscliv2.zip && sudo ./aws/install"

# AWS SAM
RUN bash -c "curl -Ls 'https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip' -o '/tmp/aws-sam-cli-linux-x86_64.zip' && unzip '/tmp/aws-sam-cli-linux-x86_64.zip' -d '/tmp/sam-installation' && sudo '/tmp/sam-installation/install' && sam --version"

# AWS CDK
RUN bash -c "npm install -g aws-cdk"




# docker build --progress=plain --no-cache -f .gitpod.Dockerfile .