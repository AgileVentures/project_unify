require 'childprocess'
require 'timeout'
require 'httparty'

# get the address and port if present (e.g. when running on c9.io)
host = ENV['IP'] || 'localhost'
port = ENV['PORT'] || '9999'
url = "http://#{host}:#{port}"

puts "starting app on #{url}"

# Start the app
server = ChildProcess.build('rackup', '--host', host, '--port', port)
server.start

# Wait a bit until it is has fired up...
Timeout.timeout(3) do
  loop do
    begin
      HTTParty.get("#{url}")
      break
    rescue Errno::ECONNREFUSED =>
        try_again
      sleep 0.1
    end
  end
end

# Stop the app when all the tests finish
at_exit do
  puts "shutting down app on #{url}"
  server.stop
end
