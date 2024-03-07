FROM ubuntu:latest
#update packages
RUN apt -y update
RUN apt -y upgrade
#install git
RUN apt -y install git
RUN apt install python3 python3-pip -y
#update pip
RUN python3 -m pip install --upgrade pip
#install ml and ai packages
RUN pip install --no-input keras
RUN pip install --no-input --ignore-installed flask
#install fix dependcies
RUN apt-get -y update && apt-get -y install libgl1
RUN apt-get -y install libglib2.0-0
#copy folder with script
COPY app /app
WORKDIR /app
#install addition packages
RUN pip install --no-input h5py pip install typing-extensions pip install wheel
#add ffmeg
RUN apt-get -y install ffmpeg libavcodec-extra
#install playwright dependencies
RUN playwright install-deps  
#install main app/packages
RUN pip install --no-input llmstack
#last update and upgrade
RUN apt -y update
RUN apt -y upgrade
#switch to root user to execute the script
USER root
#run script
#RUN chmod +x /app/llmstack
#fix permission
RUN mkdir /root/.llmstack/
COPY app /root/.llmstack
#RUN chmod -R +rwx ~/.llmstack/ && ls -l ~/.llmstack/
#RUN chown -R root:root ~/.llmstack/ && ls -l ~/.llmstack/
#RUN cp /app/config ~/.llmstack/config && ls -l ~/.llmstack/
#export port for web
EXPOSE 3000
# Set the default CMD to print the usage of the language image
CMD llmstack