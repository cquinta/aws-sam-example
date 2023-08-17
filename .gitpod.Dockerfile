FROM gitpod/workspace-full


# OS Packages
RUN bash -c "sudo apt-get update"
RUN bash -c "sudo pip install --upgrade pip"
RUN bash -c "sudo install-packages gettext tmux htop"


# AWS CLI
RUN bash -c "curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip' && unzip awscliv2.zip && sudo ./aws/install"

#AWS SAM
RUN bash -c "curl -Ls 'https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip' -o '/tmp/aws-sam-cli-linux-x86_64.zip' && unzip '/tmp/aws-sam-cli-linux-x86_64.zip' -d '/tmp/sam-installation' && sudo '/tmp/sam-installation/install' && sam --version"


# AWS CDK
RUN bash -c "npm install -g aws-cdk"

AWS CloudFormation CLI
RUN bash -c "pip install cloudformation-cli cloudformation-cli-java-plugin cloudformation-cli-go-plugin cloudformation-cli-python-plugin cloudformation-cli-typescript-plugin"

# Red Hat OpenShift
#RUN bash -c "mkdir -p '/tmp/openshift-installer' && wget -nv -O '/tmp/openshift-installer/openshift-install-linux.tar.gz' 'https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/openshift-install-linux.tar.gz' && tar zxvf '/tmp/openshift-installer/openshift-install-linux.tar.gz' -C '/tmp/openshift-installer' && sudo mv  '/tmp/openshift-installer/openshift-install' '/usr/local/bin/' && rm '/tmp/openshift-installer/openshift-install-linux.tar.gz'"
#RUN bash -c "mkdir -p '/tmp/rosa' && wget -nv -O '/tmp/rosa/rosa-linux.tar.gz' 'https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/rosa/latest/rosa-linux.tar.gz' && tar zxvf '/tmp/rosa/rosa-linux.tar.gz' -C '/tmp/rosa' && sudo mv  '/tmp/rosa/rosa' '/usr/local/bin/' && rm '/tmp/rosa/rosa-linux.tar.gz'"
#RUN bash -c "mkdir -p '/tmp/oc' && wget -nv -O '/tmp/oc/openshift-client-linux.tar.gz' 'https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/openshift-client-linux.tar.gz' && tar zxvf '/tmp/oc/openshift-client-linux.tar.gz' -C '/tmp/oc' && sudo mv '/tmp/oc/oc' '/usr/local/bin/' && sudo mv '/tmp/oc/kubectl' '/usr/local/bin/' && rm '/tmp/oc/openshift-client-linux.tar.gz'"
#RUN bash -c "mkdir -p '/tmp/ccoctl' && wget -nv -O '/tmp/ccoctl/ccoctl-linux.tar.gz' 'https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/ccoctl-linux.tar.gz' && tar zxvf '/tmp/ccoctl/ccoctl-linux.tar.gz' -C '/tmp/ccoctl' && sudo mv '/tmp/ccoctl/ccoctl' '/usr/local/bin/' && rm '/tmp/ccoctl/ccoctl-linux.tar.gz'"


# docker build --progress=plain --no-cache -f .gitpod.Dockerfile .