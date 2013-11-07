#!/bin/ruby

require "net/http"
require "uri"
require "colorize"

class DebugVerb < Net::HTTPRequest
	METHOD = "DEBUG"
	REQUEST_HAS_BODY = false
	RESPONSE_HAS_BODY = true
end

banner = '''
	****************************************
	*   ASP.NET Debugging Enabled Checker  *
	* Coded By : Luis "Connection" Santana *
	*           HackTalk Security          *
	****************************************

'''
puts banner

url = URI.parse(ARGV[0].chomp)

puts "[+] Checking #{url} for ASP.NET debugging enabled"
http = Net::HTTP.new(url.host,url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = DebugVerb.new(url.path)
request["Command"] = "stop-debug"

response = http.request(request)

if response.body =~ /OK/
	puts "[!] #{url.host} has ASP.NET debugging enabled!".light_red
else
	puts "[+] #{url.host} has ASP.NET debugging disabled.".light_green
end

puts
