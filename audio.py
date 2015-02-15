import pyaudio
from sortedcontainers import SortedDict
pyaud = pyaudio.Pyaudio()
audioBuffer = SortedDuct()
def callback(in_data, frame_count, time_info, status_flags):
    #get closest timestamp here
    timestamp = 0
    out_data = audioBuffer[timestamp]
    return (out_data, flag)
def add_audio_data(frames, timestamp):
    audioBuffer[timestamp] = frames
