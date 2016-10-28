FROM ubuntu:latest
MAINTAINER Nick Robinson <nickrobinson@gatech.edu>

RUN apt-get update
RUN apt-get install -y python-pip python-dev gcc phantomjs
RUN pip install robotframework
RUN pip install pycrypto

RUN apt-get install build-essential libssl-dev libffi-dev python-dev
RUN pip install robotframework-sshlibrary
RUN pip install robotframework-selenium2library


RUN apt-get install -y wget
RUN apt-get install -y firefox 
RUN apt-get install -y xvfb

# Install geckodriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
RUN tar xfz geckodriver-v0.11.1-linux64.tar.gz
RUN cp geckodriver /usr/bin/

# Install chrome driver
RUN wget http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip
RUN apt-get install unzip
RUN unzip chromedriver_linux64.zip
RUN cp chromedriver /usr/bin/

ENV ROBOT_TESTS /robots/

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["run.sh"]
#CMD ["/bin/bash"]