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
require 'thread'  # Queue
ssock = TCPServer.new(1234)
msgs = Queue.new
participants = []
Thread.start {  # Send chat messages to participants.
  while msg = msgs.pop;  # Always true.
    participants.each { |s|
      (s << msg).flush rescue IOError
    }
  end
}
loop {
  Thread.start(ssock.accept) { |sock|
    participants << sock
    begin
      while line = sock.gets;  # Returns nil on EOF.
        msgs << ": #{line.chomp!}\r\n"
      end
    rescue
      bt = $!.backtrace * "\n  "
      ($stderr << "error: #{$!.inspect}\n  #{bt}\n").flush
    ensure
      participants.delete sock
      sock.close
    end
  }
}
