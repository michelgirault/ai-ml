FROM tensorflow/tensorflow
#update packages
RUN apt -y update
RUN apt -y upgrade
#update pip
RUN python3 -m pip install --upgrade pip

#install ml and ai packages
RUN pip install --no-input keras
RUN pip install --no-input flask


#COPY . /app
#WORKDIR /app

#RUN pip install -r requirements.txt

#CMD ["python", "app.py"]