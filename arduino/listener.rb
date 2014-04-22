require 'socket'
require 'httparty'

$port = 8000
$looping = true

class MilkServer_1
  include HTTParty
  base_uri 'http://localhost:3000/'
end

class MilkServer_2
  include HTTParty
  base_uri '192.168.2.182:3000/'
end

class MilkServer_3
  include HTTParty
  base_uri '192.168.2.2:3000/'
end

def listen
  socket = TCPServer.open($port)
  while $looping do
    Thread.start(socket.accept) do |server|
      response = server.read
      
      options = {
        :body =>{
          :measurement => {
            :raw=>response,
            :read_time => Time.now
          }
        }
      }
      puts MilkServer_1.post('/measurements', options)
      puts MilkServer_2.post('/measurements', options)
      puts MilkServer_3.post('/measurements', options)
    end
  end
end

listen

