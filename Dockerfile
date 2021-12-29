FROM ubuntu:18.04
COPY . /app
SHELL ["/bin/bash", "-c"] 
RUN apt-get update && apt-get -y install python3 python3-pip python3-venv
WORKDIR /app/
RUN pip3 install -r requirements.txt
RUN chmod +x ./scripts/runPythonTests.sh
CMD ./scripts/runPythonTests.sh

