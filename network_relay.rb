=begin
WELL, this shit took way too long.
Can we please get something to automatically connect, and stream data through this?
this will be easier later on, hopeully. but we have something to work with.
18 errors and it works.
=end
require 'socket'
require 'thread'
require 'json'
ssock = TCPServer.new(1233)
msgs = Queue.new
def timestamp
  Time.now.to_f
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
                #msgs << "#{sock}|#{timestamp}: #{line.chomp!}\r\n"
                #puts "#{sock}|#{timestamp}: #{line.chomp!}\r\n"
                #puts (timestamp - line.to_f).to_s
                tempdata = JSON.parse(line.chomp!)
                tempdata["timestamp"] = timestamp + 2
                #FIXME: make this not hardcoded
                msgs << JSON.generate(tempdata)
#        line = line.chomp!
#        ts = timestamp
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
