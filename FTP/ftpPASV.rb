#!/bin/ruby
# Thanks to Matt Andreko for help with STDOUT redirection
# Coded by Luis 'connection' Santana
# HackTalk Security - Security From The Underground

require 'net/ftp'

puts """\n	#############################################
	#    FTP Predictable PASV Port Validator    #
	#          Coded By: Luis Santana           #
	#             HackTalk Security             #
	#############################################\n\n"""

ftp = Net::FTP.new
ftp.passive = true
ftp.debug_mode = true
puts "[+] Connecting to #{ARGV[0]}"
$stdout = File.new("/tmp/ftpPasv.txt",'w')
$stdout.sync = true
ftp.connect(ARGV[0],21)
ftp.login("anonymous","test@test.com")
5.times do 
	ftp.list("*")
end
ftp.close
$stdout = STDOUT
$stdout.flush

puts "[+] Determining Passive Ports"

File.open("/tmp/ftpPasv.txt").each do |line|
 	if line =~ /227 Entering Passive Mode \(.*,.*,.*,.*,.*,(.*)\)/
               	puts "[+] Passive Port: #{$1}"
       	end
end

File.delete("/tmp/ftpPasv.txt")
