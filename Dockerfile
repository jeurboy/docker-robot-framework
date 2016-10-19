FROM ubuntu:latest
MAINTAINER Nick Robinson <nickrobinson@gatech.edu>

RUN apt-get update
RUN apt-get install -y python-pip python-dev gcc phantomjs
RUN pip install robotframework
RUN pip install pycrypto

RUN apt-get install build-essential libssl-dev libffi-dev python-dev
RUN pip install robotframework-sshlibrary
RUN pip install robotframework-selenium2library

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh


RUN apt-get install -y wget
RUN apt-get install -y firefox 
RUN apt-get install -y xvfb
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
RUN tar xfz geckodriver-v0.11.1-linux64.tar.gz
RUN cp geckodriver /usr/bin/

CMD ["run.sh"]
#CMD ["/bin/bash"]