defmodule WebServer.WorkerServer do


  # See http://elixir-lang.org/docs/stable/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    dispatch= :cowboy_router.compile([
    {:_,[
         {"/auctions",WebServer.TopPageHandler,[]},
         {"/wins",WebServer.WinHandler,[]}
    ]}
    ])
    {:ok,_} = :cowboy.start_http(:http,100,[port: 8080],[env: [dispatch: dispatch]])
IO.inspect "run server at 8080"

  end
end
