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
  @doc ~S"""
  this function implements bid logic

  """  
  def handle(req,creatives) do

    :exometer.update([:requests],1) 
    bidPrice=1
    r = GenEvent.call(:bank,Bank,{:getMoney, bidPrice})
    
    {_,xx,_} = :cowboy_req.body(req)
    {:ok, bidrequest}=JSEX.decode(xx)
    IO.puts(bidrequest["id"])
    Agent.update(:inFlight, &Dict.put(&1, bidrequest["id"], bidPrice))
    #{bidrequest.id,bidPrice}
     
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
    
    creativesWithRightSize=creatives[whkey]
    
    
    IO.puts(JSEX.encode!(Dict.to_list creativesWithRightSize))
    #cats=Dict.take (Dict.to_list creativesWithRightSize),bidrequest["bcat"]
    cats= Dict.keys creativesWithRightSize
    
   cats=Enum.reject cats,fn(v2)->
	      #IO.puts(v)
	      #IO.puts(v2)
	      #IO.puts(v==v2)
	      Enum.any? bidrequest["bcat"], fn(v)->
	       v2==v end
	       #IO.puts(JSEX.encode!(cats))
   end
     
   IO.puts("a")
   IO.puts(JSEX.encode!(cats))
    
   creativesWithRightSize =creativesWithRightSize[hd(cats)]
   creatives=Dict.keys creativesWithRightSize 
   creatives=Enum.reject creatives, fn(v2)->
	      #IO.puts(v)
	      #IO.puts(v2)
	      #IO.puts(v==v2)
	      Enum.any? bidrequest["badv"], fn(v)->
	      IO.puts(v)
	      IO.puts(v2)
	      IO.puts(v==v2)
	       v2==v end
	       #IO.puts(JSEX.encode!(cats))
   end
   IO.puts("creatives after domain filter")
    creative=false
    if Dict.size(creatives) > 0 do
    IO.puts(JSEX.encode!( creativesWithRightSize))
    key=  hd( creatives)
    IO.puts(key)
    creative= creativesWithRightSize[key]
    IO.puts(JSEX.encode!( creative))
    end
    b=""
    if creative do
    IO.puts(JSEX.encode!(creative))
    nurl="localhost:213"
    campaign="c"
    [id,iurl,adomain,adm]=hd(creative)
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
    {:ok,req,creatives}
  end

  def terminate(_r,_e,s) do
  {:ok}
  end
end
#  :httpc.request(:get, {'http://172.17.0.3:8080/wins', []}, [], ['body'])