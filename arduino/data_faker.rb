require 'httparty'

looping = true

class MilkServer
  include HTTParty
  # base_uri 'http://milk-man.herokuapp.com/'
  base_uri 'http://127.0.0.1:3000'
end


while looping do
  response = 1000
    options = {
      :body =>{
        :measurement => {
          :raw=>response,
          :read_time => Time.now
        }
      }
    }
    puts MilkServer.post('/measurements', options)
    sleep(5)
end


