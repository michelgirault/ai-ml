FROM ubuntu:latest
#env delcaration sample
ENV EXPOSE_PORT=$EXPOSE_PORT \
    PHP_SHORT_VER=82 
#update packages
RUN apt -y update
RUN apt -y upgrade
#install git
RUN apt -y install git wget libdevmapper-dev iptables systemctl libglib2.0-0 libgl1
#install python and pip
RUN apt -y install python3 python3-pip
#update pip
RUN python3 -m pip install --upgrade pip
#install docker
#get files
RUN wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.28-1_amd64.deb \
    https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_24.0.4-1~ubuntu.22.04~jammy_amd64.deb \
    https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_24.0.4-1~ubuntu.22.04~jammy_amd64.deb \
    https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-buildx-plugin_0.11.2-1~ubuntu.22.04~jammy_amd64.deb \
    https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.20.2-1~ubuntu.22.04~jammy_amd64.deb
RUN dpkg --force-confold -i ./containerd.io_1.6.28-1_amd64.deb \
  ./docker-ce_24.0.4-1~ubuntu.22.04~jammy_amd64.deb \
  ./docker-ce-cli_24.0.4-1~ubuntu.22.04~jammy_amd64.deb \
  ./docker-buildx-plugin_0.11.2-1~ubuntu.22.04~jammy_amd64.deb \
  ./docker-compose-plugin_2.20.2-1~ubuntu.22.04~jammy_amd64.deb 
#start docker service
RUN systemctl enable docker.service
RUN systemctl enable containerd.service
#install ml and ai packages
RUN pip install --no-input keras
RUN pip install --no-input --ignore-installed flask

#install addition packages
RUN pip install --no-input h5py pip install typing-extensions pip install wheel pip install playwright docker
#add ffmeg
RUN apt-get -y install ffmpeg libavcodec-extra
#install playwright & dependencies
RUN apt-get -y install libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libatspi2.0-0 libxcomposite1 libxdamage1
RUN playwright install-deps         
#install main app/packages
RUN pip install --no-input llmstack
#last update and upgrade
RUN apt -y update
RUN apt -y upgrade
#copy folder with script
COPY app /app
WORKDIR /app
#switch to root user to execute the script
USER root
#fix permission
RUN mkdir /root/.llmstack/
COPY app /root/.llmstack
#start docker service
RUN chmod +x /app/llmstack
#expose port for web
EXPOSE $EXPOSE_PORT
# start the service 
CMD /app/llmstack