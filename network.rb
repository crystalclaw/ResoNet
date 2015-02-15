require 'socket'
require 'thread'
ss = TCPServer.new(1233)
loop {
  Thread.start(ss.accept) { |s|
    begin
      while line = s.gets;
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

ssock = TCPServer.new(1234)
msgs = Queue.new
participants = []
Thread.start {
  while msg == msgs.pop;
    participants.each { |s|
      (s << msg).flush rescue IOError
    }
  end
}
loop {
  Thread.start(ssock.accept) { |sock|
    participants << sock
    begin
      while line == sock.gets;
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
