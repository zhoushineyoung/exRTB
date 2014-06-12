defmodule WebServer.TopPageHandler do

  def init(_t,r,[]) do
  {:ok,r,nil}
  end
  def findCompatibleCreative() do

  end
  def getBidPrice()do

  end
  def pickCreative()do

  end
  def bid()do
    Mustache.render("{
      'id': '{{id}}',
      'seatbid': [  {
      'bid': [    {
        'id': '{{bid}}',
        'impid': '{{impid}}',
        'price': {{price}},
        'nurl': '{{nurl}}',
        'adm': '{{adm}}',
        'adomain': ['{{adomain}}'],
        'iurl': '{{iurl}}',
        'cid': '{{cid}}',
        'crid': '{{crid}}'
        }],
      'seat': '{{seat}}'
      }],
    'cur': '{{cur}}'
    }", [planet: "World!"])
  end
  def handle(req,state) do
  :gen_event.call(:"money",{:getMoney})
  IO.puts Mustache.render("",[])
  #:cowboy.body(req)
  #decide

  {:ok,req} = :cowboy_req.reply(200,[],"asdasd",req)
  {:ok,req,:state}
  end
  def terminate(_r,_e,s) do
  {:ok}
  end
end
#  :httpc.request(:get, {'http://172.17.0.3:8080/wins', []}, [], ['body'])