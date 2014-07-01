#index creatives
defmodule WebServer.CreativeIndex do
  def start do
    {:ok, spawn_link(fn -> loop(%{}) end)}
  end

  defp loop(state) do
    receive do
      {:get, {}, caller} ->
      	     IO.puts("g2")
        send caller, state
        loop(state)
      {:put, [id,w,h,iurl,adomain,cat]} ->
        whkey=String.to_atom(w <> h)
	IO.puts("p2")  
    	cat = String.to_atom(cat)
        d=Dict.update(state,whkey,%{},fn(v)->
		Dict.update!(v,cat,%{},fn(v2)->
			"asd"
		end)
    	end)
	loop(state)
    end
  end  

  # Callbacks
  
end  
