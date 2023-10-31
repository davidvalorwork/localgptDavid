#!/bin/bash

docker start localgptdavid

# Delete old files
docker exec localgptdavid rm /run_localGPT_API.py
docker exec localgptdavid rm /ingest.py
docker exec localgptdavid rm -rf /SOURCE_DOCUMENTS
docker exec localgptdavid rm -rf /DB

# Update changes
docker cp run_localGPT_API.py localgptdavid:/run_localGPT_API.py
docker cp ingest.py localgptdavid:/ingest.py
docker cp SOURCE_DOCUMENTS localgptdavid:/SOURCE_DOCUMENTS
docker exec localgptdavid python3 ingest.py

# Restart
docker stop localgptdavid
docker start -i localgptdavid