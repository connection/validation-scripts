#!/bin/ruby
require 'minhttp'
require 'colorize'

data = <<-HTTP
PROPFIND / HTTP/1.0\r
Host:\r
Content-Length: 0\r

HTTP

target = ARGV[0]
puts """\n        #######################################
        # PROPFIND IP Address Leakage Checker #
        # Coded By : Luis \"connection\" Santana#
        # HackTalk Security                   #
        #######################################\n\n"""

puts "[+] Connecting to #{target}"
EventMachine::run do
	Http::Min.connect(target, data) do |raw_response, parsed_response|
		response = raw_response[0..9001]
		if response =~ /https?:\/\/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/
			puts "[!] Host Vulnerable To PROPFIND IP Leakage!\n    IP Address: #{$1}".red
		else
			puts "[+] Host Is Not Vulnerable To PROPFIND IP Leakage!\n".green
		end
		EM::stop
	end
end
