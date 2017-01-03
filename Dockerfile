FROM centos:centos7

RUN yum install -y java-1.7.0-openjdk

ENV JENKINS_HOME /var/jenkins_home

RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

VOLUME /var/jenkins_home

RUN mkdir -p $JENKINS_HOME/jnlp

COPY start_jnlp.sh $JENKINS_HOME/jnlp/start_jnlp.sh

EXPOSE 2222

RUN mkdir -p $JENKINS_HOME/.ssh

COPY id_rsa.pub $JENKINS_HOME/.ssh/authorized_keys

RUN chmod 600 $JENKINS_HOME/.ssh/authorized_keys

RUN yum -y install openssh-server openssh-clients

COPY sshd_config /etc/ssh/sshd_config  

RUN chkconfig sshd on

USER jenkins

CMD ["/bin/bash", "/var/jenkins_home/jnlp/start_jnlp.sh"]
