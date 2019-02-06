FROM python:3

WORKDIR /usr/src/app
ENV serv="--server" s="-s" scrape="--scrape"

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./nut.py  $s $scrape " ]
CMD [ "python", "./nut.py $serv " ]
