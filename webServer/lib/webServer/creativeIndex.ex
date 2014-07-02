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
    	catt = String.to_atom(cat)
	c=%{}
	c=Dict.put_new(c,catt,[])
	
        adm=Mustache.render(exchangeTemplate,[iurl: "asdasd"])
	IO.puts(adm)
	c=Dict.update(c,catt,[],fn(v2)->
		[[id,iurl,adomain,
			adm]
			|v2]
	end)
	d = Dict.put_new(state,whkey,c)
    	
	loop(d)
    end
  end  

  # Callbacks
  
end  
