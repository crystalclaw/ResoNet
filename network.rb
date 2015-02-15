
port1 = 256
port2 = 255
quit1 = false
require 'socket'
servant = TCPServer.new('localhost', port1)
servoid = TCPServer.new('localhost', port2)
loop do
  until quit1 == true
    connection = servoid.accept
    if Thread.start(servoid.accept)
      puts 'received connection'
      connection.write 'Data Caught'
      connection.close
    else
      connection.close
    end
    servant.write 'Data Pitched'
    puts 'Data Got: ' + servant.recv(port2)
  end
end
=begin
require 'socket'  # TCPServer
ss = TCPServer.new(1233)
loop {
  Thread.start(ss.accept) { |s|
    begin
      while line = s.gets;  # Returns nil on EOF.
        (s << "You wrote: #{line.inspect}\r\n").flush
      end
    rescue
      bt = $!.backtrace * "\n  "
      ($stderr << "error: #{$!.inspect}\n  #{bt}\n").flush
    ensure
      s.close
    end
  }
}
=end
