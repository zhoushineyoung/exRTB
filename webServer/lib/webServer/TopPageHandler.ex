defmodule WebServer.TopPageHandler do

  def init(_t,r,s) do
      IO.puts(JSEX.encode!(s))
  {:ok,r,s}
  #rrCreatives=0
  end
  def findCompatibleCreative() do

  end
  def getBidPrice()do

  end
  
  def pickCreative(availableOnes) do
    # todo make state
    #rrCreatives=rem(rrCreatives+1,Dict.size(availableOnes))
    elem(availableOnes,0)
  end
  def bid(creative,price,cur) do
#    Mustache.render("{
#      'id': '{{id}}',
#      'seatbid': [  {
#      'bid': [    {
#        'id': '{{bid}}',
#        'impid': '{{impid}}',
#        'price': {{price}},
#        'nurl': '{{nurl}}',
#        'adm': '{{adm}}',
#        'adomain': ['{{adomain}}'],
#        'iurl': '{{iurl}}',
#        'cid': '{{cid}}',
#        'crid': '{{crid}}'
#        }],
#      'seat': '{{seat}}'
#      }],
#    'cur': '{{cur}}'
#    }", creative ++ [price: price] ++ [cur: cur])
  end
  
  def handle(req,creatives) do
    bidPrice=1
    r = GenEvent.call(:bank,Bank,{:getMoney, bidPrice})
    {_,xx,_} = :cowboy_req.body(req)
    {:ok, bidrequest}=JSEX.decode(xx)
    
     
    #internalCreativeRepresentat
    
    
    #creative = pickCreative(creatives)
    #IO.puts(elem(creatives[:"32050"][:"IAB"],0))
    IO.puts(JSEX.encode!(creatives))
    [imp|_]=bidrequest["imp"]
    nurl="localhost:213"
    campaign="c".
    {_,b}=JSEX.encode(
	%{ 
	   :id=>bidrequest["id"],
	    :seatbid=> [ %{
		      :bid=> [
		      %{
        		:id=> '0',
        		:impid=> imp["id"],
        		:price=> bidPrice,
        		:nurl=> nurl,
        		:adm => "markup",
        		#:adomain=> creative[:adomain],
        		#:iurl=> creative[:iurl],
        		:cid=> campaign,
        		#:crid=> creative[:id]
        		}],
      		      :seat=> '0'
      	              }],
            :cur=> "USD"			 
      })
    {:ok,req} = :cowboy_req.reply(200,[], b,req)
    {:ok,req,[]}
  end
  def terminate(_r,_e,s) do
  {:ok}
  end
end
#  :httpc.request(:get, {'http://172.17.0.3:8080/wins', []}, [], ['body'])