import socket
import time
import pyaudio
import wave
import sys
import json
import base64

CHUNK = 1024
FILE = "/Users/Crystalclaw/github/ResoNet/test.wav"

ip_addr="localhost"
soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 1233
soc.setblocking(1)
soc.connect((ip_addr, port))

wf = wave.open(FILE, 'rb')
data = wf.readframes(CHUNK)

while data != '':
    soc.send(json.dumps({"frames" : base64.b64encode(data)}))
    data = wf.readframes(CHUNK)
soc.close()
