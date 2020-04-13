from flask import Flask, request
import aerospike
import os
import datetime
import time
import socket
import uuid

app = Flask(__name__)

config = {
  'hosts': [ (os.environ.get('AEROSPIKE_HOST', 'prod_aerospike_1'), 3000) ],
  'policies': { 'key': aerospike.POLICY_KEY_SEND }
}

host = socket.gethostbyname(socket.gethostname())

@app.route('/')
def hello():

    try:
        
        if aerospike.client(config).is_connected()==False:
            client = aerospike.client(config).connect()

        id = str(uuid.uuid1());

        # Insert the 'hit' record
        ts =  int(round(time.time() * 1000))
        client.put(("test", "hits", id), {"server": host, "ts": ts} )

        # Maintain our summaries for the grand total and for each server
        client.increment(("test", "summary", "total_hits"), "total", 1)

        client.increment(("test", "summary", host), "total", 1)
        
        (key, meta, bins) = client.get(("test","summary","total_hits"))
        
        # Return the updated web page
        return "Hello World! I have been seen by %s." % bins["total"]

    except Exception as e:
        return "Hummm - %s looks like we have an issue, let me try again" % "err: {0}".format(e)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)