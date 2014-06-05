defmodule WebServer.TopPageHandler do

  def init(_t,r,[]) do
  {:ok,r,nil}
  end
  def handle(req,state) do
  {:ok,req} = :cowboy_req.reply(200,[],"asdasd",req)
  {:ok,req,:state}
  end
  def terminate(_r,_e,s) do
  {:ok}
  end
end