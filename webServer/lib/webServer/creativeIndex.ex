#index creatives
defmodule WebServer.CreativeIndex do
  def start do
    {:ok, spawn_link(fn -> loop(%{}) end)}
  end

  defp loop(state) do
    exchangeTemplate="{{iurl}}"
    receive do
      {:get, {}, caller} ->
      	     IO.puts("g2")
        send caller, state
        loop(state)
      {:put, [id,w,h,iurl,adomain,cat]} ->
        whkey=w+h
	IO.puts("p2")  
    	catt = cat #String.to_atom(cat)
	c=%{}
#	c=Dict.put_new(c,catt,[])
	a=%{}
	a=Dict.put_new(a,adomain,[])
	
        adm=Mustache.render(exchangeTemplate,[iurl: "asdasd"])
	IO.puts(adm)
	a=Dict.update(a,adomain,[],fn(v2)->
		[[id,iurl,adomain,
			adm]
			|v2]
	end)
	c = Dict.put_new(c,catt,a)
	d = Dict.put_new(state,whkey,c)
    	
	loop(d)
    end
  end  

  # Callbacks
  
end  
