FROM amd64/ubuntu:20.04
MAINTAINER Nurseiit A <nurs@unist.ac.kr>

RUN apt-get update && apt-get install -yq build-essential unzip device-tree-compiler wget vim

ADD . /home/vagrant/hw
WORKDIR /home/vagrant/hw

RUN echo "export RISCV=/home/vagrant/tools/riscv/" >> /root/.bashrc
RUN echo "export PATH=/home/vagrant/tools/riscv/bin:$PATH" >> /root/.bashrc

RUN bash init.sh

RUN apt-get clean autoclean && \
      rm -rf /var/lib/apt/* /var/lib/cache/* /var/lib/log/*

WORKDIR /moon

CMD ["bash"]