FROM tensorflow/tensorflow
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


COPY app /app
WORKDIR /app

#install addition packages
RUN pip install --no-input h5py pip install typing-extensions pip install wheel

RUN pip install --no-input llmstack


RUN chmod +x /app/llmstack

#RUN ["/app/llmstack"]
USER root
ENTRYPOINT [ "/app/llmstack" ]
CMD ["/usr/local/bin/llmstack"]