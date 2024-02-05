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


COPY . /app
WORKDIR /app

#RUN pip install -r requirements.txt

CMD ["bash", "llmstack"]