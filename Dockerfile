FROM ubuntu:18.04
COPY . /app
SHELL ["/bin/bash", "-c"] 
RUN apt-get update && apt-get -y install python3 python3-pip
WORKDIR /app/
EXPOSE 8000 
RUN python3 -m pip install django
CMD python3 manage.py runserver 0.0.0.0:8000
