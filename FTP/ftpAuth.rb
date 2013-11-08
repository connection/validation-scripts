#!/bin/ruby
require 'socket'
require 'colorize'

puts "	*******************************"
puts "	*   FTP AUTH Command Checker  *"
puts "	*       By: Luis Santana      *"
puts "	*       HackTalk Security     *"
puts "	*******************************"
puts
s = TCPSocket.new "#{ARGV[0]}", 21
s.gets
s.puts "AUTH GSSAPI"
s.flush
line = s.gets
if line =~ /500.*command not understood/
	puts "[!] #{ARGV[0]} Does Not Support AUTH Command!".red
else
	puts "[+] #{ARGV[0]} Supports AUTH Command!".green
end
s.close
