FROM tensorflow/tensorflow
RUN pip install keras
RUN pip install flask


#COPY . /app
#WORKDIR /app

#RUN pip install -r requirements.txt

#CMD ["python", "app.py"]