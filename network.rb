=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end

require 'socket'
servant = TCPSocket.new('', 9691)
servoid = TCPServer.new('', 1969)
loop{
  connection = servoid.accept
  puts 'received: ' + connection.recv(9691)
  connection.write 'Data Caught'
  connection.close

  servant.write 'Data Pitched'
  puts 'Data Got: ' + servant.recv(1969)
  servant.close
}
