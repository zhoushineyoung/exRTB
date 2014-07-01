defmodule WebServer.WorkerServer do


  # See http://elixir-lang.org/docs/stable/Application.html
  # for more information on OTP Applications
  def init() do
  end
  
  def start_link( _args) do

    state=%{:size=> 1}
    stat=%{:size=>state}
    {:ok,pid}=WebServer.CreativeIndex.start()
    item=[  	
	   "0",
	   "320",
	   "50",
	   "nikolamandic.github.io/favicon.gif",
	   "nikolamandic.github.io",
	   "IAB"
	]
    IO.puts("p1")
    send pid, {:put,item}
    IO.puts("g1")
    send pid, {:get,{},self()}
    receive do
    	    stat->
    dispatch= :cowboy_router.compile([
    {:_,[
         {"/auctions",WebServer.TopPageHandler,stat},
         {"/wins",WebServer.WinHandler,[]}
    ]}
    ])

    IO.inspect "run server at 8080"
    {:ok,_} = :cowboy.start_http(:http,100,[port: 8080],[env: [dispatch: dispatch]])

    end
  end
end
