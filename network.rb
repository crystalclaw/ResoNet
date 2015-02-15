=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end
port1 = 256
port2 = 255
quit1 = false
require 'socket'
servant = TCPServer.new('localhost', port1)
servoid = TCPServer.new('localhost', port2)
loop do
  until quit1 == true
    connection = servoid.accept
    puts connection
    if connection.recv(port1)
     then puts 'received connection'
      connection.write 'Data Caught'
      connection.close
    else
      connection.close
    end
    servant.write 'Data Pitched'
    puts 'Data Got: ' + servant.recv(port2)
  end
end
