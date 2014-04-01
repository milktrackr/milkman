require 'socket'
require 'httparty'

$port = 8000
$looping = true

class MilkServer
  include HTTParty
  base_uri 'http://milk-man.herokuapp.com/'
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
      puts MilkServer.post('/measurements', options)
    end
  end
end

listen

