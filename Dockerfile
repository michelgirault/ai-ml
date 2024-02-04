FROM tensorflow/tensorflow
#update packages
RUN apt update
RUN apt upgrade
#install ml and ai packages
RUN pip install keras
RUN pip install flask


#COPY . /app
#WORKDIR /app

#RUN pip install -r requirements.txt

#CMD ["python", "app.py"]