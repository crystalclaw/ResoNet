=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end

require 'socket'

hostname = 'localhost'
port = 1969

open_socket = TCPSocket.open(hostname, port)

while line = open_socket.gets
  puts line.chop
end

open_socket.close
