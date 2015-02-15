import socket
import time

ip_addr="localhost"
soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 1233
soc.setblocking(1)
soc.connect((ip_addr, port))
print(soc.recv(4096))
soc.close()
