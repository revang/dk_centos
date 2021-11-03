FROM  centos:7
LABEL maintainer="revang.alternative@foxmail.com"

# 修改镜像源
RUN  mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY application_data/Yum/Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo

######################### 安装软件 #########################

#   - vim         ---> 文本编辑器
#   - unzip       ---> 解压
#   - tree        ---> 文件查看
#   - python36    ---> Python
#   - python3-pip ---> Pip
RUN yum install -y vim unzip tree python36 python3-pip

######################### 修改配置 #########################

# 配置Bash
COPY application_data/Bash/.bash_env     /root/.bash_env
COPY application_data/Bash/.bash_profile /root/.bash_profile
RUN  echo ""                                   >> /root/.bashrc \
     && echo "if [ -f ~/.bash_profile ]; then" >> /root/.bashrc \
     && echo "    source ~/.bash_profile"      >> /root/.bashrc \
     && echo "fi"                              >> /root/.bashrc

# 配置Python
RUN rm -f /usr/bin/python \
    && ln -s /usr/bin/python3.6 /usr/bin/python \
    && sed -i "1c #!/usr/bin/python2.7" /usr/bin/yum \
    && sed -i "1c #!/usr/bin/python2.7" /usr/libexec/urlgrabber-ext-down \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && pip install pip -U \ 
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 指定工作区
WORKDIR /root
