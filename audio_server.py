import socket
import time
import pyaudio
import wave
import sys
from array import array

CHUNK = 1024
FILE = "/Users/Crystalclaw/github/ResoNet/test.wav"


ip_addr="localhost"
soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 1233
soc.setblocking(1)
soc.connect((ip_addr, port))

wf = wave.open(FILE, 'rb')
data = wf.readframes(CHUNK)
print(wf.getframerate())
while data != '':
    senddata = [elem.encode("hex") for elem in data]
    senddata = [senddata, (time.time() + 2)]
    soc.send(str(senddata))
    data = wf.readframes(CHUNK)
    time.sleep(0.1)
soc.close()
