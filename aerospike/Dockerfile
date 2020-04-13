FROM python:2.7
ADD . /code
WORKDIR /code
RUN apt-get update
RUN apt-get -y install python-dev
RUN apt-get -y install libssl-dev
RUN pip install --no-cache-dir flask requests aerospike
EXPOSE 5000
CMD python app.py