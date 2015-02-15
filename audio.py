import pyaudio
from sortedcontainers import SortedDict
import socket
import time
import json
import threading
import base64

def network_thread():
    ip_addr="localhost"
    soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    port = 1233
    soc.setblocking(1)
    soc.connect((ip_addr, port))
    while true:
        tempdata = json.loads(soc.recv(4096))
        add_audio_data(base64.b64decode(tempdata["frames"]), tempdata["timestamp"])
    soc.close()

netthread = threading.Thread(None, network_thread, "net-thread")
netthread.start()

pyaud = pyaudio.Pyaudio()
audioBuffer = SortedDict()

def callback(in_data, frame_count, time_info, status_flags):
    timestamp = time_info[output_buffer_dac_time] + pyaud.get_output_latency()
    if audioBuffer[timestamp] == nil:
        out_stamp = audioBuffer[audioBuffer.bisect_right(timestamp)]
        out_data = audioBuffer[out_stamp]
        audioBuffer.pop(out_stamp)
    else:
        out_data = audioBuffer[timestamp]
        audioBuffer.pop(timestamp)
    return (out_data, pyaudio.paContinue)


def add_audio_data(frames, timestamp):
    audioBuffer[timestamp] = frames

stream = pyaud.open(format=paInt32, channels=2, rate=1440, output=True, stream_callback=callback)

stream.start_stream()

while stream.is_active():
    time.sleep(0.1)

stream.close()
