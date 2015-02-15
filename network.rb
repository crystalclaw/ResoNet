=begin
WELL, this shit took way too long.
Can we please get something to automatically connect, and stream data through this?
this will be easier later on, hopeully. but we have something to work with.
18 errors and it works.
=end
require 'socket'
require 'thread'
ssock = TCPServer.new(1233)
msgs = Queue.new
def timestamp
  Time.now.strftime("%Y-%m-%d %H:%M:%S.%L")
end
participants = []
Thread.start do
  while msg = msgs.pop
    participants.each do |s|
      (s << msg).flush rescue IOError
    end
  end
end
loop do
  Thread.start(ssock.accept) do |sock|
    participants << sock
    begin
      while line = sock.gets
        msgs << "#{sock.to_s}: #{line.chomp!}\r\n"
      end
    rescue
      bt = $!.backtrace * "\n  "
      ($stderr << "error: #{$!.inspect}\n  #{bt}\n").flush
    ensure
      participants.delete sock
      sock.close
    end
  end
  puts participants.to_s
end
puts [participants, timestamp]
