require 'childprocess'
require 'timeout'
require 'httparty'
require File.join(File.dirname(__FILE__), 'config')

puts "starting app on #{Config.apiUri}"

# Start the app
server = ChildProcess.build('rackup', '--host', Config.apiHost, '--port', Config.apiPort)
server.start

# Wait a bit until it is has fired up...
Timeout.timeout(10) do
  loop do
    begin
      HTTParty.get("#{Config.apiUri}")
      break
    rescue Errno::ECONNREFUSED =>
        try_again
      sleep 0.5
    end
  end
end

# Stop the app when all the tests finish
at_exit do
  puts "shutting down app on #{Config.apiUri}"
  server.stop
end
