=begin
create class 'Network'
1969  contains- fucntions for reception and sending of packets, whole network, timestamp included.
=end
require 'socket'                

server = TCPServer.open(1969)   
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
    client.puts(Time.now.strftime("%Y-%m-%d %H:%M:%S.%L")) # Send the time to the client
    client.puts(request_packet)
    client.puts "Packet_Sent" # Will allow for network checks
    client.close                
  end
}
open_socket.close
