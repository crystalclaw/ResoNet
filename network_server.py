import socket
import time
import pyaudio
import wave
import sys
import yaml
CHUNK = 1024
FILE = #stuff

ip_addr="localhost"
soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 1233
soc.setblocking(1)
soc.connect((ip_addr, port))

wf = wave.open(FILE, 'rb')
data = wf.readframes(CHUNK)

while data != '':
    soc.send(yaml.dump({:frames => data}))
    data = wf.readframes(CHUNK)
soc.close()
