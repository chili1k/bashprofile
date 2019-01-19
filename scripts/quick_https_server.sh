#!/bin/bash

SERVERCERT=/tmp/server.pem

openssl req -x509 -newkey rsa:2048 -keyout key.pem -out $SERVERCERT -days 365 -nodes -batch -subj "/C=ZZ/CN=someserver.com"
cat key.pem >> $SERVERCERT
rm key.pem

cat <<EOF | python
import BaseHTTPServer, SimpleHTTPServer
import ssl

httpd = BaseHTTPServer.HTTPServer(('0.0.0.0', 4443), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, certfile='$SERVERCERT', server_side=True)
print("Started server on 4443")
httpd.serve_forever()
EOF

rm $SERVERCERT

