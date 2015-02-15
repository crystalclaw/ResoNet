=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end
loop{
require 'socket'
servoid = TCPServer.new('', 1969)
  connection = servoid.accept
  puts 'received: ' + connection.recv(9691)
  connection.write 'Data Caught'
  connection.close

require 'socket'
servant = TCPSocket.new('', 9691)
servant.write 'Data Pitched'
puts 'Data Got: ' + servant.recv(1969)
servant.close
}
