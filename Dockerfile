FROM postgres:12
LABEL maintainer="Richard Abdill rxivist@umn.edu"

RUN apt-get update && apt-get install -y python3 python3-pip

# TODO: these env vars shouldn't be necessary
ENV LANGUAGE="C"
ENV LC_ALL="C"

ADD . /app
WORKDIR /app
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "/app/spider.py"]
