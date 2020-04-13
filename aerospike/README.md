# Aerospike

## Start

```bash
#start aerospike and app.py
docker-compose up
#then visit http://localhost:5000

#aql tool, start with docker
#-h <host>, aerospike server host
docker run -ti --name aerospike-aql --rm aerospike/aerospike-tools aql -h 10.14.44.61 --no-config-file
docker run -ti --name aerospike-aql --rm aerospike/aerospike-tools aql -h 10.14.44.61 --no-config-file
```
