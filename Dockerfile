FROM ubuntu:latest
LABEL maintainer="Clive Walkden <clivewalkden@gmail.com>"

RUN apt-get update && \
    apt-get install -y git python3-pip python3-selenium chromium-chromedriver python3-pil && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/x0rz/phishing_catcher.git
WORKDIR /opt/phishing_catcher
RUN pip3 install -r requirements.txt

WORKDIR /opt/phishing_catcher
ENTRYPOINT ["python3", "./catch_phishing.py”]