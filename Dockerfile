FROM python:3
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get install --no-cache git-core curl build-essential openssl libssl-dev \
 && git clone https://github.com/nodejs/node.git \
 && cd node \
 && ./configure \
 && make \
 && sudo make install

COPY . .
CMD ls && npm -v

ENTRYPOINT [ "python", "./nut.py" ]

EXPOSE 9000
