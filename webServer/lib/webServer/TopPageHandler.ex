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
  'id': 'lM4Fshngvq',
  'seatbid': [  {
    'bid': [    {
      'id': '1',
      'impid': '1',
      'price': 0.493,
      'nurl': '',
      'adm': '',
      'adomain': [''],
      'iurl': '',
      'cid': '',
      'crid': '1192NA==T3Blcm'
    }],
    'seat': '121/'
  }],
  'cur': 'USD'
}", [planet: "World!"])
  end
  def handle(req,state) do
  IO.puts :cowboy.body(req)
  #decide

  {:ok,req} = :cowboy_req.reply(200,[],"asdasd",req)
  {:ok,req,:state}
  end
  def terminate(_r,_e,s) do
  {:ok}
  end
end
#  :httpc.request(:get, {'http://172.17.0.3:8080/wins', []}, [], ['body'])