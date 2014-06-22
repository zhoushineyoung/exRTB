FROM centos
MAINTAINER Nikola mn080202@gmail.com
RUN yum install gcc glibc-devel make ncurses-devel openssl-devel autoconf -y
RUN yum install -y wget tar -y
RUN wget https://packages.erlang-solutions.com/erlang/esl-erlang-src/otp_src_17.0.tar.gz --no-check-certificate
RUN tar zxvf otp_src_17.0.tar.gz
RUN cd ./otp_src_17.0
RUN cd ./otp_src_17.0;./configure && make && make install
RUN yum install git -y
RUN git clone https://github.com/elixir-lang/elixir.git
RUN export HOME=/root;export LANG=en_US.UTF-8;cd elixir;make clean test
RUN export HOME=/root;export LANG=en_US.UTF-8;cd elixir;make install
