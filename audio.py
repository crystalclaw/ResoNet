import pyaudio
from sortedcontainers import SortedDict
pyaud = pyaudio.Pyaudio()
audioBuffer = SortedDict()
def callback(in_data, frame_count, time_info, status_flags):
    timestamp = time_info[output_buffer_dac_time] + pyaud.get_output_latency()
    if audioBuffer[timestamp] == nil:
        out_stamp = audioBuffer[audioBuffer.bisect_right(timestamp)]
        out_data = audioBuffer[out_stamp]
        audioBuffer.pop(out_stamp)
    else
        out_data = audioBuffer[timestamp]
        audioBuffer.pop(timestamp)
    return (out_data, pyaudio.paContinue)
def add_audio_data(frames, timestamp):
    audioBuffer[timestamp] = frames
stream = pyaud.open(format=paInt32, channels=2, rate=1440, output=True, stream_callback=callback)
stream.start_stream()
