import pyaudio
import socket
import time
import threading
import numpy as np
#NYI: make this automatic
framer = 44100
#HACK(crystalclaw): This is ugly. it is to fix a glitch on my machine. comment it out if you run it.
#beginning here
import sys
sys.path.append('/Library/Python/2.7/site-packages/sortedcontainers-0.9.4-py2.7.egg')
#ending here

from sortedcontainers import SortedDict
pyaud = pyaudio.PyAudio()
audioBuffer = SortedDict()
comparisonDict = SortedDict()
#max: 2147483647
#min:-2147483647
#finish: 4096
filler=np.int32(2147483647)


def network_thread():
    ip_addr="localhost"
    soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    port = 1233
    soc.setblocking(1)
    soc.connect((ip_addr, port))
    while True:
        #HACK: this is hacked togeather and is really unsafe. Needs to be fixed.
        tempdata = eval(soc.recv(4096))
        frames=tempdata[0]
        timestamp=tempdata[1]
        frames=[elem.decode("hex") for elem in data]
        frames=''.join(frames)
        add_audio_data(frames, timestamp)
    soc.close()

netthread = threading.Thread(None, network_thread, "net-thread")
netthread.start()

def callback(in_data, frame_count, time_info, status_flags):
    #fix output_buffer_dac_time
    timestamp = time_info['output_buffer_dac_time']
    if audioBuffer == comparisonDict:
        #fix this. return silence or somthing
        print('empty!')
        out_data=filler
    else:
        if audioBuffer.has_key(timestamp):
            out_data = audioBuffer[timestamp]
            audioBuffer.pop(timestamp)
        else:
            out_stamp = audioBuffer[audioBuffer.bisect_right(timestamp)]
            out_data = audioBuffer[out_stamp]
            audioBuffer.pop(out_stamp)
    return (out_data, pyaudio.paContinue)


def add_audio_data(frames, timestamp):
    audioBuffer[timestamp] = frames

stream = pyaud.open(format=pyaudio.paInt16, channels=2, rate=framer, output=True, stream_callback=callback)

stream.start_stream()

while stream.is_active():
    time.sleep(0.1)

stream.close()
