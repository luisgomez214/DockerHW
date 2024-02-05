FROM ubuntu:16.04

MAINTAINER Luis.Gomez.25@lambda.compute.cmc.edu

#RUN apt-get update -y && \
#    apt-get install -y python-pip python-dev
RUN apt-get update -y && \
       apt-get install -y python3-pip python3-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

#RUN pip install -r requirements.txt
RUN pip3 install --upgrade pip==20.3.4 && \
      pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
