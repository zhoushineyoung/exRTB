defmodule WebServer.TopPageHandler do

  def init(_t,r,s) do
      #IO.puts(JSEX.encode!(s))
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
    #whkey=String.to_atom(bidrequest.w <> bidrequest.h)
    #creative=hd(creatives[whkey][:"IAB"])
    #banner = hd(bidrequest["imp"])["banner"]
    #IO.puts(JSEX.encode!(hd(bidrequest["imp"])["banner"]["w"]))
    
    [imp|_]=bidrequest["imp"]
    banner=imp["banner"]
        
    IO.puts(JSEX.encode!(bidrequest["bcat"]))
    whkey=banner["w"] + banner["h"]
    #creative=hd(creatives[whkey][:"IAB"])
    creativesWithRightSize=creatives[whkey]
    
    #categoriesEnum.filter(bidrequest["bcat"]),fn(v)->   Dict.has_key?(creativesWithRightSize,v) end)
    #Enum.filter(Dict.keys(creatives[whkey]),fn(v)-> bidrequest["bcat"] end)
    cats=Dict.keys creativesWithRightSize
    Enum.each bidrequest["bcat"] , fn(v)-> 
    	      IO.puts(v)
	      cats=Enum.reject cats,fn(v2)->
	      IO.puts(v)
	      IO.puts(v2)
	       v2==v end
    end
    if Dict.size cats do
    creative =hd(creativesWithRightSize[hd(cats)])
    end
    b=""
    if creative do
    IO.puts(JSEX.encode!(cats))
    nurl="localhost:213"
    campaign="c"
    [id,iurl,adomain,adm]=creative
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
        		:adm => adm,
        		:adomain=> adomain,
        		:iurl=> iurl,
        		:cid=> campaign,
        		:crid=> id
        		}],
      		      :seat=> "0"
      	              }],
            :cur=> "USD"			 
      })
      end
    {:ok,req} = :cowboy_req.reply(200,[], b,req)
    {:ok,req,[]}
  end
  def terminate(_r,_e,s) do
  {:ok}
  end
end
#  :httpc.request(:get, {'http://172.17.0.3:8080/wins', []}, [], ['body'])