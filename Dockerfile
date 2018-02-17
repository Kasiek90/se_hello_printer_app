FROM python: 2.7
WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p /usr/src/hello_world_printer/
ADD hello_world/ /usr/src/hello_world_printer/hello_world/

ADD main.py /usr/src/hello_world_printer/
RUN ls /usr/src/h
