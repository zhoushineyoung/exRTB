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
  #:gen_event.call(:"money",{:registerWin})
  #auctionID=false
  #IO.puts(auctionID)
  IO.puts("auctionID")

  #{auction, req2}= :cowboy_req.qs_val('auctionid',req)
  
   case :cowboy_req.qs_vals( req) do
                #{undefined, _} -> IO.puts("no echo_get querystring parameter")
                #{x, _} -> IO.puts(x)
		{x,req2} -> 
			 [{<<"auctionID">>,auctionIDR},{<<"priceWon">>,priceWon}]=x
			 auctionID= auctionIDR
 			 priceWon=String.to_integer( priceWon)
			 
            end
  
  IO.puts( auctionID)
  IO.puts(priceWon)
  #if auctionID do
  Agent.update(:inFlight, fn (d)->
    IO.puts("asd")
    priceInFlight=Dict.get(auctionID)
  #  ##now send to money manager
    #:gen_event.call(:money,{:registerWin,priceInFlight,priceWon})
    Dict.delete(d, auctionID)
   end
    
    )
  # end 
  #IO.puts :cowboy.body(req)
  #decide
  IO.puts("endR")
  {:ok,req} = :cowboy_req.reply(200,[],"asdasd",req)
  {:ok,req,state}
  end
  def terminate(_r,_e,s) do
  {:ok}
  end
end