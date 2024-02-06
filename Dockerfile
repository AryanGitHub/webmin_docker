FROM ubuntu:latest
RUN apt upgrade -y && apt update -y
RUN apt install -y neovim sudo curl wget apt-utils gnupg2 software-properties-common supervisor perl make net-tools iproute2
RUN wget -qO- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
RUN add-apt-repository "deb http://download.webmin.com/download/repository sarge contrib"
RUN apt upgrade -y && apt update -y
RUN apt -y install webmin
RUN echo "root:newpassword" | chpasswd
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-n"]
#CMD ["service", "webmin", "start"]
EXPOSE 10000/tcp
