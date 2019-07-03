FROM python:3-alpine

RUN mkdir /arrsync && cd /arrsync && wget https://github.com/TeddOravec/RadarrSync/raw/master/RadarrSync.py && wget https://github.com/TeddOravec/RadarrSync/raw/master/SonarrSync.py && wget https://github.com/TeddOravec/RadarrSync/raw/master/requirements.txt && wget https://github.com/TeddOravec/RadarrSync/raw/master/entrypoint.sh

RUN chmod 755 /entrypoint.sh && pip install -r requirements.txt 

CMD [ "/arrsync/entrypoint.sh" ]
