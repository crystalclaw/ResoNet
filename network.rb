port1 = 256
port2 = 255
connection_closed = false
require 'socket'
servant = TCPServer.new('localhost', port1)
servoid = TCPServer.new('localhost', port2)
puts 'Running Program'
loop do
  until connection_closed
    connection = servoid.accept
    if servoid.accept then
    connection.write 'received connection'
    connection.close
    connection_closed = true
    end
  servant.write 'Data Pitched'
  puts 'Data Got: ' + servant.recv(port2)
  end
end
