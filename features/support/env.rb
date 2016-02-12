require 'childprocess'
require 'timeout'
require 'httparty'

server = ChildProcess.build('rackup', '--port', '9999')
server.start
sleep(5)

at_exit do
  server.stop
end
