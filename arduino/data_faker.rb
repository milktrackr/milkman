require 'httparty'

looping = true

class MilkServer
  include HTTParty
  base_uri 'http://milk-man.herokuapp.com/'
  # base_uri 'http://127.0.0.1:3000'
end

current_amount = 0

while looping do
  # response = rand(800)+200
  if(rand(100)<10)
    response = 0
  else  
    response = current_amount - rand(500)
    if response < 0 
      current_amount = rand(800)+200
      response = 200
    else
      current_amount = response
    end
  end
  
    options = {
      :body =>{
        :measurement => {
          :raw=>response,
          :read_time => Time.now
        }
      }
    }
    puts MilkServer.post('/measurements', options)
    sleep(60)
end


