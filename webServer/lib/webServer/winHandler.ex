defmodule WebServer.WinHandler do

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