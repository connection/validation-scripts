require 'minhttp'
require 'colorize'

data = <<-HTTP
GET /x.printer HTTP/1.0\r
Host: #{ARGV[0]}\r

HTTP

target = ARGV[0]
puts """\n        
	##########################################
        # Microsoft IIS ISAPI Enabled Checker    #
        # Coded By : Luis \"connection\" Santana #
        # HackTalk Security                      #
        ##########################################\n\n"""

if ARGV.empty?
	puts "Usage : ruby iisISAPI.rb <site>".red
	puts "Example : ruby iisISAPI.rb testsite.com".red
	exit
end

puts "[+] Connecting to #{target}"
EventMachine::run do
	Http::Min.connect(target, data) do |raw_response, parsed_response|
		response = raw_response[0..9001]
		if response =~ /<b>web.*<\/b>/
			puts "[!] Host Has IIS ISAPI Enabled!\n".red
		else
			puts "[+] Host Does Not Have IIS ISAPI Enabled!\n".green
		end
		EM::stop
	end
end

