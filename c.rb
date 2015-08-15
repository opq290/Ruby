require 'socket'
TCP_PORT = 12345

def vote(sel, addr=$addr, name=$name)
  TCPSocket.open(addr, TCP_PORT){|s|
    s.puts "#{sel} #{name}"
    s.gets.chomp
  }
end

def set addr, name
  $addr = addr
  $name = name
end

if $0 == __FILE__
  $addr = ARGV.shift || (print("addr? "); gets.chomp)
  $name = ARGV.shift || (print("name? "); gets.chomp)
  puts vote(ARGV.shift || (print("selection? "); gets.chomp))
end