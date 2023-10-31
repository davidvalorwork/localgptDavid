#!/bin/bash

cd ..

# Starting GPT docker
docker start davidgpt

# Delete old files
docker exec -it davidgpt sh -c "rm run_localGPT_API.py"
docker exec -it davidgpt sh -c "rm ingest.py"
docker exec -it davidgpt sh -c "rm -rf SOURCE_DOCUMENTS"
docker exec -it davidgpt sh -c "rm -rf DB"

# Update changes
docker cp run_localGPT_API.py davidgpt:run_localGPT_API.py
docker cp ingest.py davidgpt:ingest.py
docker cp SOURCE_DOCUMENTS davidgpt:SOURCE_DOCUMENTS
docker exec -it davidgpt sh -c "ls"
docker exec -it davidgpt sh -c "python3 ingest.py"
# docker exec -it davidgpt bash

# Restart
docker stop davidgpt
docker start -i davidgpt