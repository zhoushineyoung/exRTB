FROM elixir
MAINTAINER Nikola mn080202@gmail.com
RUN export HOME=/root;export LANG=en_US.UTF-8;yum install gnuplot -y
RUN export HOME=/root;export LANG=en_US.UTF-8;yum install libtemplate-perl -y
RUN export HOME=/root;export LANG=en_US.UTF-8;yum install autoconf -y
RUN export HOME=/root;export LANG=en_US.UTF-8;git clone https://github.com/processone/tsung.git
RUN export HOME=/root;export LANG=en_US.UTF-8;cd tsung; ./configure && make;sudo make install
