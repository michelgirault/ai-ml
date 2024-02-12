FROM tensorflow/tensorflow:latest-gpu
#update packages
RUN apt -y update
RUN apt -y upgrade
#install git
RUN apt -y install git
#update pip
RUN python3 -m pip install --upgrade pip
#install ml and ai packages
RUN pip install --no-input keras
RUN pip install --no-input --ignore-installed flask
#install fix dependcies
RUN apt-get -y update && apt-get -y install libgl1
#copy folder with script
COPY app /app
WORKDIR /app
#install addition packages
RUN pip install --no-input h5py pip install typing-extensions pip install wheel
#install main app/packages
RUN pip install --no-input llmstack
#switch to root user to execute the script
USER root
#run script
RUN chmod +x /app/llmstack
#RUN /app/llmstack
#RUN /bin/bash -c "/app/llmstack"
#fix permission
RUN mkdir ~/.llmstack/ && ls -l ~/.llmstack/
RUN chmod -R +rwx ~/.llmstack/ && ls -l ~/.llmstack/
RUN chown -R root:root ~/.llmstack/ && ls -l ~/.llmstack/
RUN cp /app/config ~/.llmstack/config && ls -l ~/.llmstack/

# Set the default CMD to print the usage of the language image
CMD llmstack