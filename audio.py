import pyaudio
from sortedcontainers import SortedDict
pyaud = pyaudio.Pyaudio()
audioBuffer = SortedDict()
def callback(in_data, frame_count, time_info, status_flags):
    timestamp = 0
    if audioBuffer[timestamp] == nil:
        out_stamp = audioBuffer[audioBuffer.bisect_right(timestamp)]
        out_data = audioBuffer[out_stamp]
        audioBuffer.pop(out_stamp)
    else
        out_data = audioBuffer[timestamp]
        audioBuffer.pop(timestamp)
    return (out_data, flag)
def add_audio_data(frames, timestamp):
    audioBuffer[timestamp] = frames
