=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end
port1= 256
port2= 255
quit1 = false
require 'socket'
servant = TCPSocket.new('localhost', port1)
servoid = TCPServer.new('localhost', port2)
loop{
  until quit1 = true
    connection = servoid.accept
    if
    puts 'received: ' + connection.recv(port1)
    then
    connection.write 'Data Caught'
    connection.close
  else
    connection.close
  end

  servant.write 'Data Pitched'
  puts 'Data Got: ' + servant.recv(port2)
  servant.close
 end
}
keyword_end
