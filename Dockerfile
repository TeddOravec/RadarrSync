FROM python:3-alpine

run wget https://github.com/TeddOravec/RadarrSync/raw/master/RadarrSync.py && wget https://github.com/TeddOravec/RadarrSync/raw/master/SonarrSync.py && wget https://github.com/TeddOravec/RadarrSync/raw/master/requirements.txt && wget https://github.com/TeddOravec/RadarrSync/raw/master/entrypoint.sh

# Copy the script and requirements. Note that we don't copy Radarr.txt or Sonarr.txt- these need to be bind-mounted
COPY SonarrSync.py /
COPY RadarrSync.py / 
COPY requirements.txt / 
COPY entrypoint.sh / 

RUN chmod 755 /entrypoint.sh && pip install -r requirements.txt 

CMD [ "/entrypoint.sh" ]
