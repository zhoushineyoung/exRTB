defmodule WebServer.AppSupervisor do
  use Supervisor.Behaviour
  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end
  def init([]) do
    children = [
       supervisor(WebServer.BMSupervisor, [:a1]),
      # Define workers and child supervisors to be supervised
      worker(WebServer.Money, [:aa])
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    supervise(children, strategy: :one_for_one)
  end
end
