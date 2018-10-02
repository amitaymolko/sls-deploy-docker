FROM amazonlinux:2017.03

# Define working directory

RUN yum install -y sudo 
# Install Node.js & other dependencies
RUN sudo yum -y update && \
    sudo yum install -y gcc-c++ make
RUN  sudo yum install -y curl && \
    sudo yum install -y git && \
    sudo curl -sL https://rpm.nodesource.com/setup_8.x | sudo bash - && \
    sudo yum install -y python nodejs

RUN sudo curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo && \
    sudo yum install -y yarn

RUN  sudo yum install -y epel-release
RUN  sudo yum -y update && sudo yum install -y python-pip python-setuptools
RUN  sudo yum -y update && sudo yum install -y python36 python36-pip 
RUN python3 -m pip install --upgrade pip 

RUN sudo python3 -m pip install --upgrade --user awscli && \
    export PATH=$HOME/.local/bin:$PATH 

RUN sudo npm install -g node-gyp && \
    node-gyp clean && \
    npm cache verify

RUN sudo npm install -g serverless

RUN export PATH=$PATH:/usr/local/bin

