FROM centos:centos6

RUN yum install -y passwd
RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y sudo
RUN yum install -y which

RUN useradd vagrant
RUN passwd -f -u vagrant

RUN mkdir -p /home/vagrant/.ssh
RUN chown vagrant /home/vagrant/.ssh
RUN chmod 700 /home/vagrant/.ssh

COPY sshkey/host2docker.pub /home/vagrant/.ssh/authorized_keys
RUN chown vagrant /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys

RUN echo "vagrant    ALL=(ALL)       ALL" >> /etc/sudoers.d/vagrant

RUN sed -i -e "s:^UsePAM yes$:#UsePAM yes:" /etc/ssh/sshd_config
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

EXPOSE 22

CMD /usr/sbin/sshd -D
