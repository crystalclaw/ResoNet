=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end
require 'socket'
servoid = TCPServer.new('', 1969) # '' means to bind to "all interfaces", same as nil or '0.0.0.0'
loop {
  connection = a.accept
  puts "received:" + connection.recv(9691)
  connection.write 'Data Caught'
  connection.close
}

require 'socket'
servant = TCPSocket.new('', 9691) # could replace 127.0.0.1 with your "real" IP if desired.
servant.write "Data Pitched"
puts "got back:" + servant.recv(1969)
servant.close
